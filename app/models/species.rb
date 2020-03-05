class Species < ApplicationRecord
    has_many :symptoms, dependent: :destroy
end
