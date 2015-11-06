class MergeGuestFirstNameLastName < ActiveRecord::Migration
  def change
    rename_column :guests, :first_name, :full_name
    remove_column :guests, :last_name
  end
end
