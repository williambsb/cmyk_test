class AddImageIdToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :image_id, :integer
  end
end
