class SolutionsController < ApplicationController
  def show
    @solution = Solution.find(params[:id])
  end

  def link
    solution = Solution.find params[:id]

    redirect_to solution.link
  end
end
