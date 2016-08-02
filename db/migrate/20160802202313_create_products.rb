class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.integer :delivery_time
      t.integer :revisions
      t.string :requirements

      t.timestamps null: false
    end
  end
end
