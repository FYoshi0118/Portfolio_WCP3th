class CreateSakes < ActiveRecord::Migration[5.1]
  def change
    create_table :sakes do |t|
      t.integer :brewery_id, null: false, index: true
      t.string  :brand, null: false, index: true
      t.string  :specially_designated, index: true
      t.string  :recipe, index: true
      t.string  :flavor, index: true
      t.float   :nihonshudo, index: true
      t.float   :acidity, index: true
      t.boolean :is_confirmed, null: false, index: true, default: false # false => 未確認、true => 確認済み

      t.timestamps
    end
  end
end
