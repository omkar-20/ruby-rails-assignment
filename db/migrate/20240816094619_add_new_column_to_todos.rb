class AddNewColumnToTodos < ActiveRecord::Migration[7.1]
  def change
    add_column :todos, :completed_at, :string
  end
end
