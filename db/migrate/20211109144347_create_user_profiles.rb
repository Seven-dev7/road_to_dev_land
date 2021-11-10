class CreateUserProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :codewars_nickname
      t.string :city
      t.string :country
      t.datetime :date_of_birth
      t.belongs_to :user

      t.timestamps
    end
  end
end
