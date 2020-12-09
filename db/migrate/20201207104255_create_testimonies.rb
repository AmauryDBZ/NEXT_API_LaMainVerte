class CreateTestimonies < ActiveRecord::Migration[6.0]
  def change
    create_table :testimonies do |t|
      t.text :content
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
