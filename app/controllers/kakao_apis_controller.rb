class KakaoApisController < ApplicationController
  def create
    param = params.permit(:userRequest, :bot, :action)
    logger.info "params: #{params}"
    logger.info "userRequest: #{params[:userRequest]}"
    logger.info "bot: #{params[:bot]}"
    logger.info "action: #{params[:action]}"
    logger.info "param: #{param}"
    render json: {response: :success}    
  end
end