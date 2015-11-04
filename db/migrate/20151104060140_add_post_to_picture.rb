class AddPostToPicture < ActiveRecord::Migration
  def change
    add_reference :pictures, :post, index: true, foreign_key: true
  end
end
