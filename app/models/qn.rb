class Qn < ApplicationRecord
  belongs_to :section
  has_many :qs
  validates :name,           presence: true
end
