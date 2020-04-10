ActiveAdmin.register Question do
  menu false
  # show 페이지에서만 보이는 커스텀 버튼 생성
  action_item :create, only: :show do
      # 커스텀 버튼을 클릭했을 때 요청 생성
      # if 통해서 분기 처리
      link_to "#{resource.class.name} 생성", new_admin_question_path
  end
  
end
