class AddAttendingIndToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :attending_ind, :boolean, { :default => false }
  end
end
