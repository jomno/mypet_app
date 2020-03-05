class KakaoApisController < ApplicationController
  def create
    params = request.request_parameters
    saved_data = KakaoApi.create(input_data: params)
    render json: {
        "version": "2.0",
        "data": {
          "msg": params.dig("action", "params", "species")
        }
      }
  end
end