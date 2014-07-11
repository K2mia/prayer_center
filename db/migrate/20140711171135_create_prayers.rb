class CreatePrayers < ActiveRecord::Migration
  def change
    create_table :prayers do |t|
      t.integer :user_id
      t.string :prayer
      t.integer :ptype
      t.boolean :public

      t.timestamps
    end
  end
end
