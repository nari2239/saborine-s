class Record < ApplicationRecord
  validates :date, presence: true
  validates :time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1440, message: '0~1440分の範囲で記入してください。' } 
  validates :skip, length: { minimum: 0, maximum: 1000, message: '1000文字以内で記入してください。' }, allow_blank: true
  validates :to_do, length: { minimum: 0, maximum: 1000, message: '1000文字以内で記入してください。' }, allow_blank: true

  belongs_to :user
end
