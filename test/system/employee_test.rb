require "application_system_test_case"

class StaffDateTest < ApplicationSystemTestCase

    test "can create employee as user" do
        sign_in users(:regular)
        visit staff_dates_url
    
        click_on "Add Date"
        fill_in "Date", with: "01-01-2020"
        click_on "Create Staff date"
        assert_selector "a", text: "January 01, 2020"

        click_on "a", text: "January 01, 2020"
        assert_selector "h1", text: "Staffing"
        assert_selector "h2", text: "January 01, 2020"

        click_on id: "icon_add_employee"
        fill_in "Name", with: "John Doe"
        fill_in "Employee number", with: "12345"
        fill_in "Comment", with: "This is a comment"
        click_on "Create Employee"  # This is the submit button        
        assert_selector "div", text: "John Doe"

    end
end