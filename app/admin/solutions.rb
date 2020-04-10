ActiveAdmin.register Solution do
	# index 페이지를 표시하는 부분
	index do
		# 체크박스 필드 표시
		selectable_column

		# ID 필드 표시
		id_column

		# 나머지 칼럼 정보 표시
		column :title
		# column :link
		# column :yes_symptoms
		# column :no_symptoms

		# 보기, 수정, 삭제 링크 표시
		actions
	end

	# 생성, 수정을 위한 폼 정의
	form do |f|
		f.inputs do
			f.input :title
			f.input :result
			f.input :s_id
			f.input :first_aids
			f.input :species_name
			f.input :symptom_name
			f.input :symptom_details
			# f.has_many :taggings, heading: '' do |t|
			# 	t.input :symptom
			# 	t.input :status
			# end
		end
		# 저장/취소 버튼
		f.actions
	end

	# show 페이지에서만 보이는 커스텀 버튼 생성
    action_item :create, only: :show do
        # 커스텀 버튼을 클릭했을 때 요청 생성
        # if 통해서 분기 처리
        link_to "#{resource.class.name} 생성", new_admin_solution_path
    end
end
