class CreateGuestFoodstuffs < ActiveRecord::Migration
  def change
    create_table :guest_foodstuffs do |t|
      t.references :guest, index: true, foreign_key: true
      t.references :foodstuff, index: true, foreign_key: true
      t.text :additional_info

      t.timestamps null: false
    end
  end
end
