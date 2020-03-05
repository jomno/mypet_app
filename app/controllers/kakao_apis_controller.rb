class KakaoApisController < ApplicationController
  def create
    params = request.request_parameters
    bot_user_key = params.dig("userRequest", "user", "properties", "bot_user_key")
    plusfriend_user_key = params.dig("userRequest", "user", "properties", "plusfriend_user_key")
    user = User.find_or_create_by(bot_user_key: params[:bot_user_key], plusfriend_user_key: params[:plusfriend_user_key])
    # user = User.find_or_create_by(bot_user_key: bot_user_key, plusfriend_user_key: plusfriend_user_key)
    saved_data = KakaoApi.create(input_data: params, user: user)
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
    params = request.request_parameters
    bot_user_key = params.dig("userRequest", "user", "properties", "bot_user_key")
    plusfriend_user_key = params.dig("userRequest", "user", "properties", "plusfriend_user_key")
    user = User.find_or_create_by(bot_user_key: params[:bot_user_key], plusfriend_user_key: params[:plusfriend_user_key]) if Rails.env.development?
    user = User.find_or_create_by(bot_user_key: bot_user_key, plusfriend_user_key: plusfriend_user_key) if Rails.env.production?
    
    saved_data = KakaoApi.create(input_data: params, user: user)

    intent = params["intent"] if Rails.env.development?
    intent = params.dig("intent", "name") if Rails.env.production?

    symptom_name = params["symptom"] if Rails.env.development?
    symptom_name = params.dig("action", "params", "symptom") if Rails.env.production?

    present_symptom = Symptom.find_by(name: symptom_name)
    
    yes_symptoms = user.yes_symptoms.ids
    no_symptoms = user.no_symptoms.ids

    if intent == "유증상 확인"
      yes_symptoms << present_symptom.id
    elsif intent == "무증상 확인"
      no_symptoms << present_symptom.id
    end

    scenario = ScenarioService.new(yes_symptoms, no_symptoms)

    if scenario.next_symptom.present?
      next_symptom = Symptom.find scenario.next_symptom

      result = {
          "version": "2.0",
          "template": {
              "outputs": [
                  {
                      "simpleText": {
                          "text": "#{present_symptom.name} 증상 확인되었습니다."
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
    else
    end


    render json: result
  end
  
  private
  def get_user
  end
end