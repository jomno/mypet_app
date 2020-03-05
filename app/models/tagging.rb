class Tagging < ApplicationRecord
  belongs_to :symptom
  belongs_to :solution

  enum status: [:유증상, :무증상]
end
