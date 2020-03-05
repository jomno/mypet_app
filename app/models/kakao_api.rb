class KakaoApi < ApplicationRecord
    belongs_to :user
    serialize :input_data, JSON
end
