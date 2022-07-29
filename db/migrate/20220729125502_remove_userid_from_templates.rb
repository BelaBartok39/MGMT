class RemoveUseridFromTemplates < ActiveRecord::Migration[7.0]
  def change
    remove_column :templates, :userid, :integer
  end
end
