class CreateCustomerFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_foods do |t|
      t.integer :food_id
      t.integer :customer_id
      t.timestamps
    end
  end
end
