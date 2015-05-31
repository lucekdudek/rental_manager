class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.decimal :price, precision: 10, scale: 2
      t.string :category
      t.integer :car_id

      t.timestamps
    end
  end
end
