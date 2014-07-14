class AddAnonToPrayers < ActiveRecord::Migration
  def change
    add_column :prayers, :anon, :boolean
  end
end
