class KakaoApi < ApplicationRecord
    belongs_to :user
    serialize :input_data, JSON

    before_create :set_default

    def set_default
        self.bot_name = input_data.dig("bot", "name")
        self.intent_name = input_data.dig("intent", "name")
    end
end
