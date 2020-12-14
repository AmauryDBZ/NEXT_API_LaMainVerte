class AddPictureOpacityToGardens < ActiveRecord::Migration[6.0]
  def change
    add_column :gardens, :picture_opacity, :float
  end
end
