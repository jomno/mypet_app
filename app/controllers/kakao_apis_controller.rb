class KakaoApisController < ApplicationController
  def create
    params = request.request_parameters
    logger.info "params: #{params}"
    logger.info "userRequest: #{params[:userRequest]}"
    logger.info "bot: #{params[:bot]}"
    logger.info "action: #{params[:action]}"
    render json: {response: :success}    
  end
end