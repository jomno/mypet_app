class CreateKakaoApis < ActiveRecord::Migration[5.2]
  def change
    create_table :kakao_apis do |t|
      t.text :input_data

      t.timestamps
    end
  end
end
