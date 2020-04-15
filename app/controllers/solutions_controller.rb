class SolutionsController < ApplicationController
  def show
    @solution = Solution.find_by(s_id: params[:id])
  end
end
