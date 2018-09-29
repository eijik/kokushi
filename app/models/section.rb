class Section < ApplicationRecord
  belongs_to :subject
  has_many :qns

  validates :name,           presence: true
end
