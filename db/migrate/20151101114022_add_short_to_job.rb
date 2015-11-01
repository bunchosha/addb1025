class AddShortToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :short, :string
  end
end
