class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :star
      t.references :product, index: true, foreign_key: true
      t.references :vendor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
