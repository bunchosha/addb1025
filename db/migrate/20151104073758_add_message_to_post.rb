class AddMessageToPost < ActiveRecord::Migration
  def change
    add_column :posts, :message, :text
  end
end
