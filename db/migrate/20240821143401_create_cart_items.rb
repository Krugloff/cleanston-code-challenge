class CreateCartItems < ActiveRecord::Migration[7.2]
  def change
    create_table :cart_items do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :cart, null: false, foreign_key: true
      t.integer :quantity, null: false, default: 0

      t.boolean :removed, null: false, default: false

      t.timestamps
    end
  end
end
