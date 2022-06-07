class StaffDatesController < ApplicationController
  before_action :set_staff_date, only: %i[ show edit update destroy ]

  # GET /staff_dates or /staff_dates.json
  def index
    @staff_dates = current_user.staff_dates
  end

  def show
  end

  # GET /staff_dates/new
  def new
    @staff_date = current_user.staff_dates.new
  end

  # GET /staff_dates/1/edit
  def edit
  end

  # POST /staff_dates or /staff_dates.json
  def create
    @staff_date = current_user.staff_dates.new(staff_date_params)

    if @staff_date.save
      respond_to do |format|
        format.html { redirect_to staff_dates_path, notice: "Date was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Date was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @staff_date.update(staff_date_params)
      respond_to do |format|
        format.html { redirect_to staff_dates_path, notice: "Date was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Date was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /staff_dates/1 or /staff_dates/1.json
  def destroy
    @staff_date.destroy
  
    respond_to do |format|
      format.html { redirect_to @staff_date, notice: "Date was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Date was successfully destroyed." }
    end
  end

  private

    def employee_params
      params.require(:employee).permit(:name, :employee_number, :comment)
    end

    def set_staff_date
      @staff_date = current_user.staff_dates.find(params[:id])
    end

    def staff_date_params
      params.require(:staff_date).permit(:date)
    end
end
