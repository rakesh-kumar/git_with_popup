class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :state
      t.string :county
      t.string :city
      t.string :suburb
      t.string :zipcode
      t.string :street
      t.string :streetno
      t.float :longitude
      t.float :latitude
      t.string :error_code

      t.timestamps
    end
  end
end
