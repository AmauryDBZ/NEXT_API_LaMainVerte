class CreateGardenLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :garden_likes do |t|
      t.belongs_to :garden
      t.belongs_to :user

      t.timestamps
    end
  end
end
