class AddUtteranceToKakaoApis < ActiveRecord::Migration[5.2]
  def change
    add_column :kakao_apis, :utterance, :text
  end
end
