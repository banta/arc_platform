class MeetupEventsController < ApplicationController
  before_action :set_meetup_event, only: %i[ show edit update destroy ]

  # GET /meetup_events or /meetup_events.json
  def index
    @meetup_events = MeetUpEventService.new.fetch_events
  end

  # GET /meetup_events/1 or /meetup_events/1.json
  def show
  end

  # GET /meetup_events/new
  def new
    @meetup_event = MeetupEvent.new
  end

  # GET /meetup_events/1/edit
  def edit
  end

  # POST /meetup_events or /meetup_events.json
  def create
    @meetup_event = MeetupEvent.new(meetup_event_params)

    respond_to do |format|
      if @meetup_event.save
        format.html { redirect_to meetup_event_url(@meetup_event), notice: "Meetup event was successfully created." }
        format.json { render :show, status: :created, location: @meetup_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meetup_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetup_events/1 or /meetup_events/1.json
  def update
    respond_to do |format|
      if @meetup_event.update(meetup_event_params)
        format.html { redirect_to meetup_event_url(@meetup_event), notice: "Meetup event was successfully updated." }
        format.json { render :show, status: :ok, location: @meetup_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meetup_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetup_events/1 or /meetup_events/1.json
  def destroy
    @meetup_event.destroy

    respond_to do |format|
      format.html { redirect_to meetup_events_url, notice: "Meetup event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meetup_event
      # @meetup_event = MeetupEvent.find(params[:id])
      @meetup_event = MeetUpEventService.new.fetch_event(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meetup_event_params
      params.require(:meetup_event).permit(:title, :description, :rsvp_link, :image, :start_time, :end_time, :venue_name, :venue_address, :venue_coordinates, :data)
    end
end
