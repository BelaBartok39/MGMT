class TemplatesController < ApplicationController
  before_action :set_template, only: %i[ show edit destroy update ]
  before_action :set_staff_date, only: %i[ new create ]

  def show
  end

  def index
    @templates = current_user.templates
  end

  def edit
    @templates = current_user.templates
  end

  def new
    @template = Template.new
  end
    
  def create
    @template = current_user.templates.new(template_params)
    @template.employees = @staff_date.employees
    
    if @template.save
      respond_to do |format|
        format.html { redirect_to staff_dates_path, notice: "Template was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Template was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end

  end

  def update
    if @template.update(template_params)
      respond_to do |format|
        format.html { redirect_to staff_dates_path, notice: "Template was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Template was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @template.destroy
  
    respond_to do |format|
      format.html { redirect_to staff_date_path, notice: "Template was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Template was successfully destroyed." }
    end
  end

  private

  def set_template
    @template = Template.find(params[:id])
  end

  def set_staff_date
    @staff_date = current_user.staff_dates.find(params[:staff_date_id])
  end

  def template_params
    params.require(:template).permit(:name)
  end
end
