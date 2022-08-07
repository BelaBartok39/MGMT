class EmployeesController < ApplicationController
  before_action :set_staff_date
  before_action :set_employee, only: %i[ show edit update destroy ]
  before_action :set_template


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

  def import_temp
    @template.employees.each do |employee|
      @staff_date.employees.build([{employee_number: 
      employee.employee_number, name: employee.name, 
      comment: employee.comment}])
    end
      @staff_date.save
    redirect_to staff_date_path(@staff_date), notice: "Template was successfully imported."
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

  def set_template
    @template = current_user.templates.find_by_id(params[:template_id])
  end

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