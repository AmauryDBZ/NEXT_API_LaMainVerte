class CreatePostComments < ActiveRecord::Migration[6.0]
  def change
    create_table :post_comments do |t|
      t.text :content
      t.belongs_to :user, index: true
      t.belongs_to :post, index: true
      
      t.timestamps
    end
  end
end
