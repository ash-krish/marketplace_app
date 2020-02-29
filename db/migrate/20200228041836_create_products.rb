class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :colour
      t.integer :size
      t.integer :price

      t.timestamps
    end
  end
end
