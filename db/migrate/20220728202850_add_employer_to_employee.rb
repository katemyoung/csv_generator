class AddEmployerToEmployee < ActiveRecord::Migration[7.0]
  def change
    change_table :employees do |t|
      t.references :employer, null: false, foreign_key: true 
    end
  end
end
