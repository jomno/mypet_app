class Question < ApplicationRecord
  belongs_to :symptom
  has_many :answers, dependent: :destroy
end
