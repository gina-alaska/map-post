class ReportsController < ApplicationController
  before_action :set_event
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /reports
  # GET /reports.json
  def index
    @q = Report.search(params[:q])
    @reports = @q.result(distinct: true)
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = current_user.reports.where(event: @event).first
    if @report.nil?
      @report = @event.reports.build
    else
      redirect_to edit_report_path(@report)
    end
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = @event.reports.build(report_params)
    @report.user = current_user

    respond_to do |format|
      if @report.save
        format.html { redirect_to @event, notice: 'Your report has been submitted and will be reviewed.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report.event, notice: 'Your report has been updated' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to @report.event, notice: 'The report was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id]) if params[:event_id].present?
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    params.require(:report).permit(:reason)
  end
end
