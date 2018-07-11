class CreateBreweries < ActiveRecord::Migration[5.1]
  def change
    create_table :breweries do |t|
      t.string :name, null: false, index: true
      t.string :name_kana, null: false, index: true
      t.string :post_code, null: false, limit: 7
      t.string :address, null: false, index: true
      t.string :phone_number, index: true, limit: 11
      t.string :email
      t.string :url

      t.timestamps
    end
  end
end
