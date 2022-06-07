class CreateStaffDates < ActiveRecord::Migration[7.0]
  def change
    create_table :staff_dates do |t|
      t.date :date, null: false

      t.timestamps
    end

  end
end
