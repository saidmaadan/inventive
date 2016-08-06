class AddVendorToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :vendor, index: true, foreign_key: true
  end
end
