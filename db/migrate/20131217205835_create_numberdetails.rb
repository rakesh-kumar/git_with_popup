class CreateNumberdetails < ActiveRecord::Migration
  def change
    create_table :numberdetails do |t|
      t.integer :mobile_number
      t.string :details
      t.decimal :amount
      t.references :serviceprovider

      t.timestamps
    end
  end
end
