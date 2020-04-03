module Api
    module V1
        class BaseController < ApiController
            def error
                render json: default_json
            end
        end
    end
end