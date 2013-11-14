class CreateDbmetas < ActiveRecord::Migration
  def change
    create_table :dbmetas do |t|
      t.string :path
      t.boolean :is_dir
      t.integer :size
    end
  end
end
