class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :firstname
      t.string :secondname
      t.integer :pesel

      t.timestamps
    end
  end
end
