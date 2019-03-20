class CreateBicycleShops < ActiveRecord::Migration[5.2]
  def change
    create_table :bicycle_shops do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :phone
      t.decimal :lat, precision: 15, scale: 10
      t.decimal :lng, precision: 15, scale: 10

      t.timestamps
    end
  end
end
