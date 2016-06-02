class AlterColumnActivityDatesStartTime < ActiveRecord::Migration
   def change
    remove_column :activity_dates, :start_date, :string
    remove_column :activity_dates, :end_date, :string
  end
end
