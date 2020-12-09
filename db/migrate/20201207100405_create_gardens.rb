class CreateGardens < ActiveRecord::Migration[6.0]
  def change
    create_table :gardens do |t|
      t.string :name
      t.integer :area
      
      t.belongs_to :user, index: true
      t.belongs_to :location, index: true
      t.belongs_to :climate, index: true
      t.belongs_to :garden_type, index: true

      t.timestamps
    end
  end
end
