class RenameNewColumnNameBackToOldColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :todos, :name, :title
  end
end
