ActiveAdmin.register Solution do
	# index 페이지를 표시하는 부분
	index do
		# 체크박스 필드 표시
		selectable_column

		# ID 필드 표시
		id_column

		# 나머지 칼럼 정보 표시
		column :title
		column :desc
		column :yes_symptoms
		column :no_symptoms

		# 보기, 수정, 삭제 링크 표시
		actions
	end

	# 생성, 수정을 위한 폼 정의
	form do |f|
		f.inputs do
			f.input :title
			f.input :desc
			f.has_many :taggings, heading: '' do |t|
				t.input :symptom
				t.input :status
			end
		end
		# 저장/취소 버튼
		f.actions
	end
end
