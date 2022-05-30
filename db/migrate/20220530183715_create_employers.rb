class CreateEmployers < ActiveRecord::Migration[7.0]
  def change
    create_table :employers do |t|
      t.integer :account_number
      t.string :name

      t.timestamps
    end
  end
end
