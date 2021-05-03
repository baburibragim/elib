class ChangeDefaultValueOfVisibleOfBooks < ActiveRecord::Migration[6.1]
  def change
    change_column_default :books, :visible, from: nil, to: true
  end
end
