class EmployeesController < ApplicationController
  before_action :set_staff_date 
  before_action :set_employee, only: %i[ show edit update destroy ]
  
  def psyche
    StaffMailer.send_staff.deliver_later

    if @employees.psyche
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "Item was successfully created." }
      end
    end
    
    head :ok

      # if @employees.psyche
      #   format.html { redirect_to employees_url(@employee), notice: "Staff was successfully sent." }
      #   format.json { render :show, status: :created, location: @employee }
      # else
      #   format.html { render :new, status: :unprocessable_entity }
      #   format.json { render json: @employee.errors, status: :unprocessable_entity }
      # end
  end

  def new
    @employee = @staff_date.employees.build
  end

  def create
    @employee = @staff_date.employees.build(employee_params)

    if @employee.save
      respond_to do |format|
        format.html { redirect_to staff_date(@staff_date), notice: "Item was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Item was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      respond_to do |format|
        format.html { redirect_to line_staff_date_path(@employee), notice: "Item was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Item was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
  
    respond_to do |format|
      format.html { redirect_to staff_date_path(@staff_date), notice: "Date was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Date was successfully destroyed." }
    end
  end

  private

  def set_employee
    @employee = @staff_date.employees.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :employee_number, :comment)
  end

  def set_staff_date
    @staff_date = current_user.staff_dates.find(params[:staff_date_id])
  end
end