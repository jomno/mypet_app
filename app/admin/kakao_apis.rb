ActiveAdmin.register KakaoApi do
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
