class AddAgencyToPost < ActiveRecord::Migration
  def change
    add_column :posts, :agency_id, :integer
  end
end
