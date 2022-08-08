class TemplatesController < ApplicationController
  before_action :set_template, only: %i[ show edit destroy update ]
  before_action :set_staff_date, only: %i[ show destroy update save ]

  def show
  end

  def index
    @templates = current_user.templates
  end

  def edit
    @templates = current_user.templates
  end

  def save
    @template = Template.new
  end
    
  def create
    @staff_date = current_user.staff_dates.find(params[:staff_date_id])
    @template = current_user.templates.create
    @template.employees = @staff_date.employees
    @template.save
  end

  def update
    if @template.update(template_params)
      respond_to do |format|
        format.html { redirect_to staff_dates_path, notice: "Date was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Date was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @template.destroy
  
    respond_to do |format|
      format.html { redirect_to staff_date_path, notice: "Date was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Date was successfully destroyed." }
    end
  end

  private

  def set_template
    @template = Template.find(params[:id])
  end

  def set_staff_date
    @staff_date = current_user.staff_dates.find(params[:id])
  end

  def template_params
    params.require(:template).permit(:name)
  end
end
