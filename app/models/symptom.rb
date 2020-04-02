class Symptom < ApplicationRecord
  belongs_to :species

  # has_many :yes_taggings, -> { send('유증상') }, class_name: :Tagging
  # has_many :yes_solutions, through: :yes_taggings, source: :solution

end
