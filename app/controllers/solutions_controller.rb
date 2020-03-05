class SolutionsController < ApplicationController
  def show
  end

  def link
    solution = Solution.find params[:id]

    redirect_to solution.link
  end
end
