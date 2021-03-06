class CreateItems < ActiveRecord::Migration[6.1]


  def change
    create_table :items do |t|
      t.string :name #商品名
      t.text :introduction #商品説明文
      t.integer :price #税抜き価格
      t.boolean :is_active
      t.integer :genre_id
      t.timestamps
    end
  end
end
