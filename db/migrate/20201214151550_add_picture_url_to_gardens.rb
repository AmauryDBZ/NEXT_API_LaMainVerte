class AddPictureUrlToGardens < ActiveRecord::Migration[6.0]
  def change
    add_column :gardens, :picture_url, :string
  end
end
