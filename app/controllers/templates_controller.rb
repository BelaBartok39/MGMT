class TemplatesController < ApplicationController
  before_action :set_staff_date

  def index
    @templates = Templates.all
  end

  def save_temp
    employees = @staff_date.employees
    @template = current_user.templates.create!(template_params)
    
    @template.name = current_user.name
    @template.employees << {employees: "nick"}
    @template.save
  end 

  private

  def set_staff_date
    @staff_date = current_user.staff_dates.find(params[:id])
  end

  def template_params
    params.permit(:name, :employees)
  end 
end
