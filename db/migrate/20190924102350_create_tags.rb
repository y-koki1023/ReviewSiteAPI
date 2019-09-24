class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.integer :review_id
      t.string :title

      t.timestamps
    end
  end
end
