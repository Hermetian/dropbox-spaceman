class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	:user_id, :total_space, :shared_used, :normal_used
      t.integer :total_space
      t.integer :shared_used
      t.integer :normal_used
      t.integer :uid

      t.timestamps
    end
  end
end
