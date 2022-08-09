class AddReferenceToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :template, null: true, foreign_key: false
  end
end
