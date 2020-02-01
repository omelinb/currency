class AddIndexToCurrenciesName < ActiveRecord::Migration[6.0]
  def change
    add_index :currencies, :name, unique: true
  end
end
