class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:attend]
  before_action :set_event, only: [:show, :edit, :update, :destroy, :attend]

  # GET /events
  # GET /events.json
  def index
    if !params[:date].nil?
      @date = params[:date]
      @events = @date == 'upcoming' ? Event.upcoming : Event.past
    else
      @events = Event.latest
    end
  end

  # POST /events/attend/1
  def attend
    attend = Attend.new(event_id: @event.id, user_id: current_user.id)
    if attend.save
      redirect_to @event, notice: 'Te has inscrito al evento'
    else
      redirect_to @event, alert: 'Hubo un problema al inscribirte al evento'
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
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

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
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
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
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
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
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
      params.require(:event).permit(:name, :details, :starts_at, :ends_at, :location, :image)
    end
end
