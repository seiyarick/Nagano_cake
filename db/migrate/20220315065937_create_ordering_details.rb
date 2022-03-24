class CreateOrderingDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :ordering_details do |t|

      t.integer :price #購入時金額
      t.integer :amount #数量
      t.integer :order_id
      t.integer :item_id
      t.integer :making_status #製造ステータス
      t.timestamps
    end
  end
end
