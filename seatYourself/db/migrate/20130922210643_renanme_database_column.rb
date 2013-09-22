class RenanmeDatabaseColumn < ActiveRecord::Migration
  def up
  	rename_column :restaurants, :category_id, :category_ids

  end
  def down
  	rename_column :restaurants, :category_ids, :category_id
  end
end
