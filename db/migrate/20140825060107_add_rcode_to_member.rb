class AddRcodeToMember < ActiveRecord::Migration
  def change
    add_column :members, :rcode, :string
  end
end
