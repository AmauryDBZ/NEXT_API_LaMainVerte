class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.belongs_to :user, index: true
      t.belongs_to :garden, index: true

      t.timestamps
    end
  end
end
