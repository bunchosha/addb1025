class AddRomaToCreator < ActiveRecord::Migration
  def change
    add_column :creators, :roma, :string
  end
end
