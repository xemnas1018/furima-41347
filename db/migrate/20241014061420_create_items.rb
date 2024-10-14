class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :item_comment, null: false
      t.integer :categry_id, null: false 
      t.integer :item_status_id, null: false 
      t.integer :shipping_fee_id, null: false 
      t.integer :prefecture_id, null: false
      t.integer :Shipping_time_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foregin_key: true  
      t.timestamps
    end
  end
end
