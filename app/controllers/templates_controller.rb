class TemplatesController < ApplicationController
  before_action :set_staff_date

  def index
    @templates = Templates.all
  end

  def save_temp
    employees = @staff_date.employees.find(params[:id])
    @template = current_user.templates.create!(template_params)

      @employees.for_each do |employee|
          @template.employees << employee.name 
      end

      if @template.save
          @template.name = current_user
          flash[:notice] = "Template was successfully created."
      else
          flash[:error] = "Template was not created."
      end
  end 

  private

  def set_staff_date
    @staff_date = current_user.staff_dates.find(params[:id])
  end

  def template_params
    params.permit(:name, :employees)
  end 

end


