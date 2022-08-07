class CreateTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :templates do |t|
      t.string :name
      t.integer :staffdateid
      t.integer :userid

      t.timestamps
    end
  end
end
