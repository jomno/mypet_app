require 'test_helper'

class SolutionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get solutions_show_url
    assert_response :success
  end

end
