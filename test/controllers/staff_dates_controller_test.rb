require "test_helper"

class StaffDatesControllerTest < ActionDispatch::IntegrationTest
    setup do
        sign_in users(:regular)
        @staff_date = staff_dates(:January)
    end

    test "redirectd if not logged in" do
        sign_out :user
        get staff_dates_url
        assert_response :redirect
        follow_redirect!
        assert_select "h1", "Log in"
    end

    test "can get index" do
        get staff_dates_url
        assert_response :success
    end

    test "can get new" do  
        get new_staff_date_url
        assert_response :success
    end

    test "can create staff_date" do
        assert_difference('StaffDate.count') do
            post staff_dates_url, params: { staff_date: { date: @staff_date.date } }
        end  

        assert_redirected_to staff_dates_url
    end

    test "cannot create staff_date with invalid attributes" do
        assert_no_difference('StaffDate.count') do
            post staff_dates_url, params: { staff_date: { date: "" } }
        end  
    end

    test "can edit staff_date" do  
        get edit_staff_date_url(@staff_date)
        assert_response :success
    end

    test "can update staff_date" do
        patch staff_date_url(@staff_date), params: { staff_date: { date: @staff_date.date } }
        assert_redirected_to staff_dates_url
        @staff_date.reload
        assert_equal @staff_date.date, @staff_date.date
    end
end