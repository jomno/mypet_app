class KakaoApisController < ApplicationController
  before_action :set_bot_data

  def create
    render json: {
        "version": "2.0",
        "template": {
            "outputs": [
                {
                    "simpleText": {
                        "text": "다시 말씀해주세요!"
                    }
                }
            ]
        }
    }
  end

  def get_solution
    intent = @params["intent"] if Rails.env.development?
    intent = @params.dig("intent", "name") if Rails.env.production?

    symptom_name = @params["symptom"] if Rails.env.development?
    symptom_name = @params.dig("action", "params", "symptom") if Rails.env.production?

    present_symptom = Symptom.find_by(name: symptom_name)
    
    # 저장된 유증상
    yes_symptoms = @user.yes_symptoms.ids
    # 저장된 무증상
    no_symptoms = @user.no_symptoms.ids

    if intent == "유증상 확인"
      yes_symptoms << present_symptom.id
      @user.yes_symptoms << present_symptom
    elsif intent == "무증상 확인"
      no_symptoms << present_symptom.id
      @user.no_symptoms << present_symptom
    end

    scenario = ScenarioService.new(yes_symptoms.uniq, no_symptoms.uniq)

    if scenario.next_symptom.present?
      next_symptom = Symptom.find scenario.next_symptom

      result = {
          "version": "2.0",
          "template": {
              "outputs": [
                  {
                      "simpleText": {
                          "text": "#{present_symptom.name} #{intent}되었습니다."
                      }
                  },
                  {
                      "simpleText": {
                          "text": "#{next_symptom.name} 증상은 있습니까?"
                      }
                  }
              ],
              "quickReplies": [
                  {
                      "action": "message",
                      "label": "예",
                      "messageText": "#{next_symptom.name} 증상이 있습니다."
                  },
                  {
                      "action": "message",
                      "label": "아니요",
                      "messageText": "#{next_symptom.name} 증상이 없습니다."
                  }
              ]
          }
      }
    elsif scenario.solution.present?
      solution = scenario.solution
      
      result = {
        "version": "2.0",
        "template": {
          "outputs": [
            {
              "basicCard": {
                "title": "결과가 나왔습니다.",
                "thumbnail": {
                  "imageUrl": "http://pet.semicolon.link#{ActionController::Base.helpers.asset_path('puppy.jpg')}"
                },
                "buttons": [
                  {
                    "action": "webLink",
                    "label": "결과 확인",
                    "webLinkUrl": "#{solution.link}"
                  },
                  {
                    "action":  "webLink",
                    "label": "펫트너로 이동",
                    "webLinkUrl": "https://petner.kr/"
                  },
                  {
                    "action":  "message",
                    "label": "처음부터 하기",
                    "messageText": "처음부터"
                  }
                ]
              }
            }
          ]
        }
      }
    else
      result = {
        "version": "2.0",
        "template": {
          "outputs": [
            {
              "basicCard": {
                "title": "없는 케이스입니다. 펫트너에서 전문 문의해주세요!",
                "buttons": [
                  {
                    "action":  "webLink",
                    "label": "펫트너로 이동",
                    "webLinkUrl": "https://petner.kr/"
                  }
                ]
              }
            }
          ]
        }
      }
    end

    render json: result
  end
  
  def reset
    @user&.user_taggings&.destroy_all

    result = {
        "version": "2.0",
        "template": {
          "outputs": [
            {
                "simpleText": {
                    "text": "처음부터 다시 시작합니다."
                }
            },
            {
                "simpleText": {
                    "text": "귓병이 있습니까?"
                }
            }
          ],
          "quickReplies": [
            {
              "action": "message",
              "label": "예",
              "messageText": "귓병 증상이 있습니다."
            }
          ]
        }
      }

    render json: result
  end

  def get_place
    place_name = @params["place"] if Rails.env.development?
    place_name = @params.dig("action", "params", "place") if Rails.env.production?

    result = {
      "version": "2.0",
      "template": {
        "outputs": [
          {
            "basicCard": {
              "title": "동물 병원 장소가 겁색되었습니다.",
              "buttons": [
                {
                  "action":  "webLink",
                  "label": "펫트너로 이동",
                  "webLinkUrl": "http://pet.semicolon.link/maps/show?place=#{place_name}"
                }
              ]
            }
          }
        ]
      }
    }

    render json: result
  end

  private
  def set_bot_data
    @params = request.request_parameters
    @bot_user_key = @params.dig("userRequest", "user", "properties", "bot_user_key")
    @plusfriend_user_key = @params.dig("userRequest", "user", "properties", "plusfriend_user_key")
    @user = User.find_or_create_by(bot_user_key: @params[:bot_user_key], plusfriend_user_key: @params[:plusfriend_user_key]) if Rails.env.development?
    @user = User.find_or_create_by(bot_user_key: @bot_user_key, plusfriend_user_key: @plusfriend_user_key) if Rails.env.production?
    
    @saved_data = KakaoApi.create(input_data: @params, user: @user)
  end
end