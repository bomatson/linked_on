class CreateOccupationsUsers < ActiveRecord::Migration
  def change
    create_table :occupations_users do |t|
      t.integer :occupation_id
      t.integer :user_id
    end
  end
end
