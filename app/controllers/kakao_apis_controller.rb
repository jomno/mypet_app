class KakaoApisController < ApplicationController
  def create
    render json: {response: :success}    
  end
end
