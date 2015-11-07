class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :rating
      t.text :text

      t.timestamps null: false
    end
  end
end
