class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :total_space
      t.integer :shared_used
      t.integer :normal_used
      t.integer :uid

      t.timestamps
    end
  end
end
