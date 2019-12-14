class AddColumnToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :post_id, :integer
  end
end
