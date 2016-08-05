class AddOmniauthFieldsToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :provider, :string
    add_column :vendors, :uid, :string
    add_column :vendors, :image, :string
  end
end
