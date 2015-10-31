class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :product_id
      t.date :pdate
      t.string :category_id
      t.integer :user_id
      t.integer :company_id
      t.text :content

      t.timestamps null: false
    end
    add_index :posts, [:user_id, :created_at]
  end
end
