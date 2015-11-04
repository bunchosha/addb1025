class AddInfoToPost < ActiveRecord::Migration
  def change
    add_column :posts, :talent_id, :integer
    add_column :posts, :product, :string
  end
end
