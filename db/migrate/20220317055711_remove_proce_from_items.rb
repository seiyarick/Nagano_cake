class RemoveProceFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :proce, :integer
  end
end
