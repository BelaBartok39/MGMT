require "application_system_test_case"

class StaffDateTest < ApplicationSystemTestCase

  test "visiting the staff dates / no user" do
    visit staff_dates_url
    assert page.has_content?("You need to sign in or sign up before continuing.")
  end

  test "visits the staff dates page" do
    sign_in users(:admin)
    visit staff_dates_url
    assert_selector "h1", text: "Staffing"
  end

  test "can create staff_date as user" do
    sign_in users(:admin)
    visit staff_dates_url

    click_on "Add Date"
    fill_in "Date", with: "01-01-2020"
    click_on "Create Staff date"
    assert_selector "a", text: "January 01, 2020"
   end

   test "can update/delete staff_date as user" do
    sign_in users(:admin)
    visit staff_dates_url

    click_on "Add Date"
    fill_in "Date", with: "01-01-2020"
    click_on "Create Staff date"
    assert_selector "a", text: "January 01, 2020"

    click_on id: "icon_date_edit"
    fill_in "Date", with: "02-01-2020"
    click_on "Update Staff date"
    assert_selector "a", text: "February 01, 2020"

    click_on id: "icon_date_delete"
    assert page.has_content?("You don't have any dates yet!")
   end

end