class User < ApplicationRecord
    has_many :kakao_apis, dependent: :nullify

    has_many :taggings, dependent: :destroy

    has_many :yes_taggings, -> { send('유증상') }, class_name: :UserTagging, dependent: :destroy
    has_many :yes_symptoms, through: :yes_taggings, source: :symptom

    has_many :no_taggings, -> { send('무증상') }, class_name: :UserTagging, dependent: :destroy
    has_many :no_symptoms, through: :no_taggings, source: :symptom

end
