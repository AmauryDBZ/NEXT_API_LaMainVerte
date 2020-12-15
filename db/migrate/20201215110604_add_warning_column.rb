class AddWarningColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :warning, :boolean, :default => false
    add_column :garden_comments, :warning, :boolean, :default => false
    add_column :gardens, :warning, :boolean, :default => false
    add_column :post_comments, :warning, :boolean, :default => false
    add_column :posts, :warning, :boolean, :default => false
    add_column :testimonies, :warning, :boolean, :default => false
    add_column :users, :warning, :boolean, :default => false
  end
end
