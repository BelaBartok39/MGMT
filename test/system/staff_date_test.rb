require "application_system_test_case"

class StaffDateTest < ApplicationSystemTestCase

  test "visiting the staff dates as a user" do
    sign_in users(:regular)
    visit staff_dates_url
    assert_selector "h1", text: "Staffing"
   end

end