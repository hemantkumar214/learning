class AddUsernameToMembers < ActiveRecord::Migration
  def change
    add_column :members, :username, :string
    add_column :members, :phone_no, :string, limit: 12
  end
end
