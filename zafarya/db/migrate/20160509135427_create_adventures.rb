class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.string :activity_name
      t.string :description
      t.string :leader
      t.string :company_name
      t.string :adress
      t.integer :max_perticipants
      t.integer :price
      t.boolean :active
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
