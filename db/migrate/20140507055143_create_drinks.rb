class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.text :description
      t.text :instructions

      t.timestamps
    end
  end
end
