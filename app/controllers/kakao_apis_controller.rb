class KakaoApisController < ApplicationController
  def create
    params = request.request_parameters
    logger.info "params: #{params}"
    logger.info "userRequest: #{params[:userRequest]}"
    logger.info "bot: #{params[:bot]}"
    logger.info "action: #{params[:action]}"
    saved_data = KakaoApi.create(input_data: params)
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
end