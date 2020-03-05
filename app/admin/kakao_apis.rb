ActiveAdmin.register KakaoApi do
  show do
    attributes_table do
      row :id
      row :create_at
      row :input_data
      row :source_json_2 do |model|
        JSON.pretty_generate(model.input_data)
      end
    end
  end
  
end
