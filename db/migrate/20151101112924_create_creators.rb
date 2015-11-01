class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.string :name
      t.integer :job_id
      t.string :agency
      t.timestamps null: false
    end
  end
end
