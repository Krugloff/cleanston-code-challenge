class CreateCarts < ActiveRecord::Migration[7.2]
  def change
    create_table :carts do |t|
      t.float :discount, null: false, default: 0

      t.timestamps
    end
  end
end
