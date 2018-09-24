class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false, index: true
      t.integer :sake_id, null: false, index: true
      t.text    :content
      t.text    :image_id
      t.integer :star,    null: false, default: 0

      t.timestamps
    end
  end
end
