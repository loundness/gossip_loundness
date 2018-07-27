class CreatePotins < ActiveRecord::Migration[5.2]
  def change
    create_table :potins do |t|
      t.string :title
      t.text :content
      t.timestamp :date

      t.timestamps
    end
  end
end
