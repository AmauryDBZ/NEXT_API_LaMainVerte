class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :date
      t.belongs_to :garden, index: true
      t.timestamps
    end
  end
end
