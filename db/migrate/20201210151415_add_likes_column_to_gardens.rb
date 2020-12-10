class AddLikesColumnToGardens < ActiveRecord::Migration[6.0]
  def change
    add_column :gardens, :likes, :integer, :default => 0
  end
end
