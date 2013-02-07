class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :first_name
      t.string :last_name
      t.text :ssn
      t.text :national_id_number
      t.text :birth_date
      t.string :facebook_id
      t.string :twitter_id
      t.string :linkedin_id
      t.integer :credit_score
      t.integer :blood_pressure
      t.integer :heart_rate
      t.integer :mph

      t.timestamps
    end
  end
end
