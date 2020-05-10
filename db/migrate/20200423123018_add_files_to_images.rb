class AddFilesToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :files, :json
  end
end
