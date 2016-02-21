class AddNotes < ActiveRecord::Migration
  def change
  	create_table(:notes) do |t|
      t.integer :user_id
      t.text :summary
    	t.timestamps
  	end
	end
end