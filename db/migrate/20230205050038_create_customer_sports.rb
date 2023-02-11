class CreateCustomerSports < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_sports do |t|
      t.integer :customer_id
      t.integer :sport_id
      t.timestamps
    end
  end
end
