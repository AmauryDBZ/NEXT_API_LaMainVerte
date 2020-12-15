class EditLocationsTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :locations, :lat, :decimal
    remove_column :locations, :long, :decimal
    remove_reference :locations, :country, index: true
  end
end
