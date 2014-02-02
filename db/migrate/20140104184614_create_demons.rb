class CreateDemons < ActiveRecord::Migration
  def change
    create_table :demons do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
