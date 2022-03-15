class CreateOrderingDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :ordering_details do |t|

      t.timestamps
    end
  end
end
