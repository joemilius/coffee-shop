class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :price
      t.references :customer, foreign_key: true, null: false
      t.references :coffee, foreign_key: true, null: false
    end
  end
end
