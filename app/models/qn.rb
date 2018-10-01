class Qn < ApplicationRecord
  belongs_to :section
  has_many :qs
  accepts_nested_attributes_for :qs
  attr_accessor :qs_attributes
  validates :name,           presence: true

  # 回答が正解かチェック
  def check(qs_attr)
    qs_attr&.all? do |k,v|
      self.qs.find(v['id']).correct_flg == (v['an_flg']=='1')
    end
  end

end
