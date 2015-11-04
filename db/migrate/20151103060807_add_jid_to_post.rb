class AddJidToPost < ActiveRecord::Migration
  def change
    add_column :posts, :job_id, :integer
  end
end
