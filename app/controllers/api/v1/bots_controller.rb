module Api
    module V1
        class BotsController < ApiController
            def get_symptoms
                intent = @params["intent"] if Rails.env.development?
                intent = @params.dig("intent", "name") if Rails.env.production?

                species_name = @params["species"] if Rails.env.development?
                species_name = @params.dig("action", "params", "species") if Rails.env.production?

                species = Species.find_by(name: species_name)

                case intent
                when "개 증상 확인하기"
                    result = base_template
                    card_ary = []
                    present_card = {}

                    species.symptoms.each do |symptom|
                        if present_card.empty?
                            present_card = basic_card_template("#{species.name}가 아프시군요.", "증상을 선택해주세요.")
                        elsif present_card.dig(:basicCard, :buttons).length < 3
                            present_card.dig(:basicCard, :buttons) << buttons_template(symptom.name, "#{species.name}종이 [#{symptom.name}] 증상이 있습니다.")
                        elsif present_card.dig(:basicCard, :buttons).length == 3
                            card_ary << present_card
                            present_card = {}
                        end
                    end
                    basic_card_template("#{species.name}가 아프시군요.")
                    result.dig(:template, :outputs) << 
                when "고양이 증상 확인하기"
                    result = default_json
                end
                
                render json: result
            end
        end
    end
end