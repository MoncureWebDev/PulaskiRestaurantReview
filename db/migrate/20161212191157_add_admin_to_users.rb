class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
    # Adding, default: false because we don't want most users to have admin priveleges
    
  end
end
