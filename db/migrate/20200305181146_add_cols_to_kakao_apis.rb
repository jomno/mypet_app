class AddColsToKakaoApis < ActiveRecord::Migration[5.2]
  def change
    add_column :kakao_apis, :bot_name, :string
    add_column :kakao_apis, :intent_name, :string
  end
end
