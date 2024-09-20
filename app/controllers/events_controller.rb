class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :set_event, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @events = policy_scope(Event).order(created_at: :desc)
  end

  def new
    @event = Event.new
    @event.photos.build
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to events_path, notice: 'Événement créé avec succès.'
    else
      render :new
    end
    authorize @event
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: 'Événement mis à jour avec succès.'
    else
      render :edit
    end
    authorize @event
  end

  def destroy
    @event.destroy
    redirect_to events_path, status: :see_other, notice: 'Événement supprimé avec succès.'
    authorize @event
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, photos: [] )
  end
end
