class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :address, null: false
      t.string :house_num, null: false
      t.string :building_name
      t.string :phone_num, null: false 
      t.references :history, null: false, foreign_key: true
      t.timestamps
    end
  end
end
