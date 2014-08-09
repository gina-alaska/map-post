class EventsController < ApplicationController
  before_action :set_device_type
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :geojson, :json, :html

  # GET /events
  # GET /events.json
  def index
    @events = Event.visible.recent

    respond_with @events
  end

  # GET /events/1
  # GET /events/1.json
  def show
    respond_to do |format|
      format.html.ajax { render layout: false }
      format.html
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user = current_user

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      if current_user.member?
        params.require(:event).permit(:title, :description, :group_id, :visible, :starts_at, :ends_at, location: [:lat, :lng])
      else
        params.require(:event).permit(:title, :description, :group_id, :starts_at, :ends_at, location: [:lat, :lng])
      end
    end
end
