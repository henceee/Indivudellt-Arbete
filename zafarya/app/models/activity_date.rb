class ActivityDate < ActiveRecord::Base
  belongs_to :adventure
  has_many   :time_slots
  accepts_nested_attributes_for :time_slots
  
  validates_associated :time_slots

end
