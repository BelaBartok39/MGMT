class AddEmployeesToTemplates < ActiveRecord::Migration[7.0]
  def change
    add_column :templates, :employees, :text, array: true, default: []
  end
end
