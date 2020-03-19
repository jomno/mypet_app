ActiveAdmin.register KakaoApi do
  scope -> { '전체' }, :all, default: true
  scope("bot1-fallback") { |scope| scope.where(bot_name: "마이펫", intent_name: "폴백 블록") }
  scope("bot2-fallback") { |scope| scope.where(bot_name: "마이펫_2", intent_name: "폴백 블록") }
  scope("bot2-symptom") { |scope| scope.where(bot_name: "마이펫_2", intent_name: "유증상 확인") }
  scope("bot2-none-symptom") { |scope| scope.where(bot_name: "마이펫_2", intent_name: "무증상 확인") }
  scope("bot2-reset") { |scope| scope.where(bot_name: "마이펫_2", intent_name: "처음부터") }

  index do
    # 체크박스 필드 표시
    selectable_column

    # ID 필드 표시
    id_column

    # 나머지 칼럼 정보 표시
    column :user
    column :bot_name
    column :intent_name
    column :created_at
    column :updated_at

    # 보기, 수정, 삭제 링크 표시
    actions
  end

  show do
    attributes_table do
      row :id
      row :created_at
      row :input_data do |model|
        pre JSON.pretty_generate(model.input_data)
      end
    end
  end
  
end
