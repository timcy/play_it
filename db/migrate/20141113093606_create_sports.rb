class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
    	t.string :name    	
    	t.string :sport_type
    	t.references :player
      t.timestamps
    end
  end
end
