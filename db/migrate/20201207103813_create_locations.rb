class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.decimal :lat
      t.decimal :long
      t.belongs_to :country, index: true

      t.timestamps
    end
  end
end
