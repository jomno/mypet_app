class KakaoApisController < ApplicationController
  def create
    params = request.request_parameters
    logger.info "params: #{params}"
    logger.info "userRequest: #{params[:userRequest]}"
    logger.info "bot: #{params[:bot]}"
    logger.info "action: #{params[:action]}"
    saved_data = KakaoApi.create(input_data: params)
    render json: {response: :success, data: saved_data}    
  end
end