class TimeSlot < ActiveRecord::Base
  belongs_to :activity_date
  
  validates :start_time,   :presence => true, date: true
  validates :end_time,     :presence => true, date: true
  
  validates :end_time,
          date: { after: :start_time }
end
