module Api
    module V1
        class BotsController < ApiController
            def get_symptoms
                intent = @params["intent"] if Rails.env.development?
                intent = @params.dig("intent", "name") if Rails.env.production?

                species_name = @params["species"] if Rails.env.development?
                species_name = @params.dig("action", "params", "species") if Rails.env.production?

                species = Species.find_by(name: species_name)
            end
        end
    end
end