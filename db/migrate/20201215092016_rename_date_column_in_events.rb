class RenameDateColumnInEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :date, :datetime
  end
end
