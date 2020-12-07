class CreateGardenComments < ActiveRecord::Migration[6.0]
  def change
    create_table :garden_comments do |t|
      t.text :content
      t.belongs_to :user, index: true
      t.belongs_to :garden, index: true

      t.timestamps
    end
  end
end
