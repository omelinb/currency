class AddIndexToCurrenciesName < ActiveRecord::Migration[6.0]
  def change
    add_index :currencies, :code, unique: true
  end
end
