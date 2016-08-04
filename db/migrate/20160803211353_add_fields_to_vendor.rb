class AddFieldsToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :fullname, :string
    add_column :vendors, :description, :string
  end
end
