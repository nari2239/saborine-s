class Record < ApplicationRecord
  validates :date, presence: true
  validates :time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1440, message: '0~1440分の範囲で記入してください。' } 
  validates :skip, length: { minimum: 0, maximum: 1000, message: '1000文字以内で記入してください。' }, allow_blank: true
  validates :to_do, length: { minimum: 0, maximum: 1000, message: '1000文字以内で記入してください。' }, allow_blank: true

  belongs_to :user

  def self.search(user_id, start_period, end_period)
    if start_period != "" && end_period != ""
      Record.where(user_id: user_id,date: start_period..end_period)
    else
      Record.where(user_id: user_id)
    end
  end
end
