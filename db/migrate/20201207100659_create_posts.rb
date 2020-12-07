class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.belongs_to :garden, index: true

      t.timestamps
    end
  end
end
