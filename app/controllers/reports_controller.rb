class ReportsController < ApplicationController
  
  before_action :authenticate_user!
  
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.admin?
      @q = Report.search(params[:q])
      @reports = @q.result(distinct: true)
    else
      @q = current_user.reports.search(params[:q])
      @reports = @q.result(distinct: true)
    end
  end

  def show
  end

  def new
    @report = Report.new
  end

  def edit
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user
    if @report.save
      redirect_to @report, notice: 'Report was successfully created.'
    else
      render :new
    end
  end

  def update
      if @report.update(report_params)
        redirect_to @report, notice: 'Report was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    if @report.destroy
      redirect_to reports_url, notice: 'Report was successfully destroyed.'
    end
  end

  private
    def set_report
      @report = Report.find(params[:id])
    end
    def report_params
      params.require(:report).permit(:width, :height, :cost, :comment)
    end
end
