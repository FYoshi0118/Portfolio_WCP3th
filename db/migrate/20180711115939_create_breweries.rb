class CreateBreweries < ActiveRecord::Migration[5.1]
  def change
    create_table :breweries do |t|
      t.string :name, null: false, index: true
      t.string :post_code, limit: 7
      t.string :address_prefecture, index: true
      t.string :address_city, index: true
      t.string :phone_number, index: true, limit: 11
      t.string :email
      t.string :url
      t.boolean :is_confirmed, null: false, index: true, default: false # false => 未確認、true => 確認済み

      t.timestamps
    end
  end
end
