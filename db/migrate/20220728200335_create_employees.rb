class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.integer :ssn
      t.string :nrc
      t.string :surname
      t.string :first_name
      t.string :other_name
      t.date :dob

      t.timestamps
    end
  end
end
