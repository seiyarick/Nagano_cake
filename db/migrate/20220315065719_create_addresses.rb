class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|

      t.timestamps
      t.string :name #宛名
      t.string :postal_code #郵便番号
      t.string :address #住所
    end
  end
end
