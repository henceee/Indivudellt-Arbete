class AddCurrencyToAdventure < ActiveRecord::Migration
  def change
    add_column :adventures, :currency, :string
  end
end
