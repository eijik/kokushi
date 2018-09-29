class Subject < ApplicationRecord
  has_many :sections
  validates :name,           presence: true
end
