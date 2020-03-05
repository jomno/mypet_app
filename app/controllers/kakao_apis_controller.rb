class KakaoApisController < ApplicationController
  def create
    param = params.permit(:userRequest, :bot, :action)
    logger.info "params: #{params}"
    logger.info "param: #{param}"
    render json: {response: :success}    
  end
end
