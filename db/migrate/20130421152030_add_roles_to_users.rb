class AddRolesToUsers < ActiveRecord::Migration
  def change
  	add_column :users,:role_type,:string
  	add_column :users,:role_id,:string
  end
end
