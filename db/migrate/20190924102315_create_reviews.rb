class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :account_id
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
