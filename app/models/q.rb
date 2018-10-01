class Q < ApplicationRecord
  belongs_to :qn

  validates :name,           presence: true
  attr_accessor :an_flg
end
