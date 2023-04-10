class VisitEventsController < ApplicationController
  before_action :set_visit_event, only: %i[ show edit update destroy ]

  # GET /visit_events or /visit_events.json
  def index
    @all_visit_events = VisitEvent.all
    @filtered = false

    if params[:month].present? && params[:year].present?
      @visit_events = VisitEvent.all.select do |event|
        date = Date.strptime(event.day, '%m%d%y')
        date.month == params[:month].to_i && date.year == params[:year].to_i
      end
      @filtered = true 
    else
      @visit_events = @all_visit_events
    end
    # @visit_events = VisitEvent.all
  end

  # GET /visit_events/1 or /visit_events/1.json
  def show
    @visit_event = set_visit_event
    # @items = Items.all
  end

  # GET /visit_events/new
  def new
    @visit_event = VisitEvent.new
  end

  # GET /visit_events/1/edit
  def edit
  end

  # POST /visit_events or /visit_events.json
  def create
    @visit_event = VisitEvent.new(visit_event_params)

    respond_to do |format|
      if @visit_event.save
        format.html { redirect_to visit_event_url(@visit_event), notice: "Visit event was successfully created." }
        format.json { render :show, status: :created, location: @visit_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @visit_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visit_events/1 or /visit_events/1.json
  def update
    respond_to do |format|
      if @visit_event.update(visit_event_params)
        format.html { redirect_to visit_event_url(@visit_event), notice: "Visit event was successfully updated." }
        format.json { render :show, status: :ok, location: @visit_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @visit_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visit_events/1 or /visit_events/1.json
  def destroy
    @visit_event.destroy

    respond_to do |format|
      format.html { redirect_to visit_events_url, notice: "Visit event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit_event
      @visit_event = VisitEvent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def visit_event_params
      params.require(:visit_event).permit(:ipaddress, :day, :bid, :eventtype)
    end
end
