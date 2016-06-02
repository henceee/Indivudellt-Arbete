class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :adventure
  
  validates :date, date: true
  validates :start_time, date: true
  validates :end_time,
          date: { after: :start_time }
end
