class MapsController < ApplicationController
  def show
    @place = params[:place]
  end
end
