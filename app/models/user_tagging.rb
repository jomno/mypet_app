class UserTagging < ApplicationRecord
  belongs_to :symptom
  belongs_to :user

  enum status: [:유증상, :무증상]
end
