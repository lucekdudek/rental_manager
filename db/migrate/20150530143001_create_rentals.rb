class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :car_id
      t.integer :client_id
      t.date :date_start
      t.date :date_stop

      t.timestamps
    end
  end
end
