class CreateActivityDates < ActiveRecord::Migration
  def change
    create_table :activity_dates do |t|
      t.datetime :date
      t.references :adventure, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
