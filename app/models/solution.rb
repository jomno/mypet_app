class Solution < ApplicationRecord
    enum result: [
        "상대적으로 낮은 위험성",
        "질병 징후 가능성 있음",
        "의료진 상담 필요",
        "준응급상황",
        "명백한 응급상황"
    ]
    # has_many :taggings, dependent: :destroy
    # has_many :symptoms, through: :taggings

    # has_many :yes_taggings, -> { send('유증상') }, class_name: :Tagging
    # has_many :yes_symptoms, through: :yes_taggings, source: :symptom

    # has_many :no_taggings, -> { send('무증상') }, class_name: :Tagging
    # has_many :no_symptoms, through: :no_taggings, source: :symptom

    # accepts_nested_attributes_for :taggings, :allow_destroy => true
end
