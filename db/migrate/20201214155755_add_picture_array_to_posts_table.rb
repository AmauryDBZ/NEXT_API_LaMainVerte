class AddPictureArrayToPostsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :pictures_url, :string, array: true, default: []
  end
end
