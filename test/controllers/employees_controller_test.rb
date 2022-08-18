require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
    setup do
        sign_in users(:regular)
            @staff_date = staff_dates(:January)
            @employee = employees(:geoff)
    end

    test "redirectd if not logged in" do
        sign_out :user
        get new_staff_date_employee_url(@staff_date)
        assert_response :redirect
        follow_redirect!
        assert_select "h1", "Log in"
    end

    test "can get new" do  
        get new_staff_date_employee_url(@staff_date)
        assert_response :success
    end

    test "can create employee" do
        assert_difference('StaffDate.count') do
            post staff_dates_url, params: { staff_date: { date: @staff_date.date } }
        end  

        assert_redirected_to staff_dates_url

        assert_difference('Employee.count') do
            post staff_date_employees_url(@staff_date), params: { employee: { name: @employee.name, employee_number: @employee.employee_number, comment: @employee.comment }, staff_date_id: @staff_date.id }
        end  

        assert_redirected_to staff_date_url(@staff_date)
    end

    test "cannot create employee with invalid attributes" do
        assert_no_difference('Employee.count') do
            post staff_date_employees_url(@staff_date), params: { employee: { name: @employee.employee_number, employee_number: @employee.comment, comment: @employee.name }, staff_date_id: @staff_date.id }
        end  
    end

    test "can edit employee" do  
        assert_difference('StaffDate.count') do
            post staff_dates_url, params: { staff_date: { date: @staff_date.date } }
        end  


        get edit_staff_date_employee_url(@staff_date, @employee)
        assert_response :success
    end

    test "can update employee" do
        patch staff_date_employee_url(@staff_date, @employee), params: { employee: { name:  "Freddy" } }
        assert_redirected_to staff_date_path(@staff_date)
        @employee.reload
        assert_equal @employee.name, "Freddy"
    end
end