class CreateFoodstuffs < ActiveRecord::Migration
  def change
    create_table :foodstuffs do |t|
      t.string :foodstuff_name
      t.string :foodstuff_description

      t.timestamps null: false
    end
  end
end
