class TemplatesController < ApplicationController
  before_action :set_date, only: %i[save_temp]

  def index
    @templates = Template.all
  end

  def save_temp
    employees = Employee.where(id: params[:staff_date_id])
    Template.create!(employees: employees)

  end

  private

  def set_date
    @staff_date = current_user.staff_dates.find(params[:id])
  end

end

# def save_temp
#   @employees = @staff_date.employees.find(params[:id])
#   template = current_user.templates.new(template_params)

#     @employees.each do |employee|
#         @template.employees << employee.name 
#     end

#     if @template.save
#         @template.name = current_user
#         flash[:notice] = "Template was successfully created."
#     else
#         flash[:error] = "Template was not created."
#     end
# end 
