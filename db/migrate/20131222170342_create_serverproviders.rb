class CreateServerproviders < ActiveRecord::Migration
  def change
    create_table :serverproviders do |t|
    	t.string :provider_name
    	t.string :state
    	t.string :plane

      t.timestamps
    end
  end
end
