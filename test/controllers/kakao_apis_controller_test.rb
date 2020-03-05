require 'test_helper'

class KakaoApisControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get kakao_apis_create_url
    assert_response :success
  end

end
