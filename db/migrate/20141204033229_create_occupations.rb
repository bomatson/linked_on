class CreateOccupations < ActiveRecord::Migration
  def change
    create_table :occupations do |t|
      t.string :title      
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
