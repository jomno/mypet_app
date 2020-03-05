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
    user = User.find_or_create_by(bot_user_key: params[:bot_user_key], plusfriend_user_key: params[:plusfriend_user_key])
    # user = User.find_or_create_by(bot_user_key: bot_user_key, plusfriend_user_key: plusfriend_user_key)
    saved_data = KakaoApi.create(input_data: params, user: user)


    render json: {
        "version": "2.0",
        "template": {
            "outputs": [
                {
                    "simpleText": {
                        "text": "간단한 텍스트 요소입니다."
                    }
                }
            ]
        }
    }
  end
  
  private
  def get_user
  end
end