class TemplatesController < ApplicationController
  before_action :set_staff_date

  def show
  end

  def index
    @templates = current_user.templates
  end

  def def new
    @template = Template.new
  end
  
  def edit
  end

  def save
    employees = @staff_date.employees
    @template = current_user.templates.create!(template_params)
    
    employees.each do |employee|
      @template.employees << employee
    end
   
    @template.save
  end 

  def update
    if @template = Template.find(params[:id])

    respond_to do |format|
      format.html { redirect_to staff_dates_path, notice: "Date was successfully updated." }
      format.turbo_stream { flash.now[:notice] = "Date was successfully updated." }
    end
    else
      render :edit, status: :unprocessable_entity
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
