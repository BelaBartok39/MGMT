class TemplatesController < ApplicationController
  def index
    @templates = Template.all
  end

  def save_temp
    @employees = current_user.staff_dates.find(params[:staff_date_id]).employees
    @template = current_user.templates.new(template_params)

    @employees.each do |employee|
        @template.employees << employee 
    end

    if @template.save
        flash[:notice] = "Template was successfully created."
    else
        flash[:error] = "Template was not created."
    end
    end 
end
