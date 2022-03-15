class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      
      t.integer :amou
      t.timestamps
    end
  end
end
