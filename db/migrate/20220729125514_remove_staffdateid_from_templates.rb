class RemoveStaffdateidFromTemplates < ActiveRecord::Migration[7.0]
  def change
    remove_column :templates, :staffdateid, :integer
  end
end
