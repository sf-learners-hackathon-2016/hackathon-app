class CreateUser < ActiveRecord::Migration[5.0]
  def change
  	create_table :user do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :email
  		t.string :phone_number
  	end
  end
end
