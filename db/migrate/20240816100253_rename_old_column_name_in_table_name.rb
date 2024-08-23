class RenameOldColumnNameInTableName < ActiveRecord::Migration[7.1]
  def change
    rename_column :todos, :title, :name
  end
end
