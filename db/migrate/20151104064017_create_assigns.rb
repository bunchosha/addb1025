class CreateAssigns < ActiveRecord::Migration
  def change
    create_table :assigns do |t|
      t.string :job
      t.integer :creator_id
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
