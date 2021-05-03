class ChangeDefaultValueForQuantityOfBooks < ActiveRecord::Migration[6.1]
  def change
    change_column_default :books, :almaty_quantity, from: nil, to: 0 
    change_column_default :books, :shymkent_quantity, from: nil, to: 0 
  end
end
