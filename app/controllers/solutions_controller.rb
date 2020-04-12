class SolutionsController < ApplicationController
  def show
    @solution = Solution.find_by(s_id: params[:id])
  end

  def link
    solution = Solution.find params[:id]

    redirect_to solution.link
  end
end
