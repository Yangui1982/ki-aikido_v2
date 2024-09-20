class ActualitiesController < ApplicationController
  before_action :set_actuality, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @actualities = policy_scope(Actuality).order(created_at: :desc)
  end

  def show
  end

  def new
    @actuality = Actuality.new
    authorize @actuality
  end

  def create
    @actuality = Actuality.new(actuality_params)
    @actuality.user = current_user
    if @actuality.save
      redirect_to root_path
    else
      render :new
    end
    authorize @actuality
  end

  def edit
  end

  def update
    @actuality.update(actuality_params)
    redirect_to root_path
    authorize @actuality
  end

  def destroy
    @actuality.destroy
    redirect_to root_path, status: :see_other
    authorize @actuality
  end

  private

  def set_actuality
    @actuality = Actuality.find(params[:id])
  end

  def actuality_params
    params.require(:actuality).permit(:content, :user)
  end
end
