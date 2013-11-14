class AddUserIdToDbmetas < ActiveRecord::Migration
  def change
    add_column :dbmetas, :user_id, :integer
  end
end
