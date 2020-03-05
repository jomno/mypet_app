class AddUserToKakaoApis < ActiveRecord::Migration[5.2]
  def change
    add_reference :kakao_apis, :user, foreign_key: true
  end
end
