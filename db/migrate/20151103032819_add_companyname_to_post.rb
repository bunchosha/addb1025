class AddCompanynameToPost < ActiveRecord::Migration
  def change
    add_column :posts, :company_name, :string
  end
end
