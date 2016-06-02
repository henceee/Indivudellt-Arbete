class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :adventure, index: true, foreign_key: true
      t.datetime :date
      t.datetime :start_time
      t.datetime :end_time
      t.integer :perticipants
      t.integer :total_price

      t.timestamps null: false
    end
  end
end
