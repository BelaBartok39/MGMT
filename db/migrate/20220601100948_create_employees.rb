class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.references :staff_date, null: false, foreign_key: true
      t.string :name
      t.integer :employee_number
      t.text :comment

      t.timestamps
    end
      add_index :employees, [:name, :staff_date_id], unique: true
  end
end
