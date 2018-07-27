class AddUserToPotin < ActiveRecord::Migration[5.2]
  def change
    add_reference :potins, :user, foreign_key: true
  end
end
