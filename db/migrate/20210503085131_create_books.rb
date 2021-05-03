class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.text :description
      t.integer :almaty_quantity
      t.integer :shymkent_quantity
      t.string :image_src
      t.string :category
      t.boolean :visible

      t.timestamps
    end
  end
end
