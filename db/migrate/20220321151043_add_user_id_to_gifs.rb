class AddUserIdToGifs < ActiveRecord::Migration[6.1]
  def change
    add_reference :gifs, :user, null: false, foreign_key: true
  end
end
