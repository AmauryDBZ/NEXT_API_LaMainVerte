class CreateGardenTags < ActiveRecord::Migration[6.0]
  def change
    create_table :garden_tags do |t|
      t.belongs_to :garden, index: true
      t.belongs_to :tag, index: true

      t.timestamps
    end
  end
end
