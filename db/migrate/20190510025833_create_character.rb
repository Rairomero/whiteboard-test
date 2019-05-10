class CreateCharacter < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :color_claws
      t.integer :kind
      t.belongs_to :user, index: { unique: true }, foreign_key: true
    end
  end
end
