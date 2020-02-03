class CreateCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :code
      t.string :rate
      t.string :nominal

      t.timestamps
    end
  end
end
