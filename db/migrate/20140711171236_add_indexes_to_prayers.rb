class AddIndexesToPrayers < ActiveRecord::Migration
  def change
    add_index :prayers, :prayer
    add_index :prayers, :ptype
  end
end
