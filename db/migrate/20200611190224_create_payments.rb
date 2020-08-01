class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :total
      t.references :orders, foreign_key: true
      t.references :payment_methods, foreign_key: true

      t.timestamps
    end
  end
end
