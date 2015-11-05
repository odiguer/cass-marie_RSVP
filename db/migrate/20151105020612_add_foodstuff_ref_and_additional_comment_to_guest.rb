class AddFoodstuffRefAndAdditionalCommentToGuest < ActiveRecord::Migration
  def change
    add_reference :guests, :foodstuff, index: true, foreign_key: true
    add_column :guests, :additional_comment, :text
  end
end
