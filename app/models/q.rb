class Q < ApplicationRecord
  belongs_to :qn

  validates :name,           presence: true
end
