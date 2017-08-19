class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :description
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
