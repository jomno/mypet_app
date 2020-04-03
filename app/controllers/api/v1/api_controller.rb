class Api::V1::ApiController < ActionController::API
    before_action :set_bot_data

    

    private
    def set_bot_data
        @params = request.request_parameters
        @bot_user_key = @params.dig("userRequest", "user", "properties", "bot_user_key")
        @plusfriend_user_key = @params.dig("userRequest", "user", "properties", "plusfriend_user_key")
        @user = User.find_or_create_by(bot_user_key: @params[:bot_user_key], plusfriend_user_key: @params[:plusfriend_user_key]) if Rails.env.development?
        @user = User.find_or_create_by(bot_user_key: @bot_user_key, plusfriend_user_key: @plusfriend_user_key) if Rails.env.production?

        @saved_data = KakaoApi.create(input_data: @params, user: @user)
    end

    def default_json
        return {
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
end