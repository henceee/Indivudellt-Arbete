class RemoveColumnTimeslotTimes < ActiveRecord::Migration
  def change
    
     remove_column :time_slots, :start_date, :string
     remove_column :time_slots, :end_date, :string
     remove_column :time_slots, :start_time, :string
     remove_column :time_slots, :end_time, :string
     
     add_column :time_slots, :start_time, :datetime
     add_column :time_slots, :end_time, :datetime
  end
end
