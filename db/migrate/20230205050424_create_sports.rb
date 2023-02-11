class CreateSports < ActiveRecord::Migration[6.1]
  def change
    create_table :sports do |t|
      t.string :name
      t.integer :kcal
      t.timestamps
    end
  end
end
