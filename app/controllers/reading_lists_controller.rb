class ReadingListsController < ApplicationController
  before_action :require_login
  before_action :set_reading_list, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @reading_list = ReadingList.new
    render :layout => false
  end

  def create
    #binding.pry
    @reading_list = current_user.reading_lists.create(reading_list_params)
    if @reading_list.save
      render json: @reading_list, status: 201
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @reading_list.update(reading_list_params)
    redirect_to user_reading_list_path(current_user.id, @reading_list)
  end

  def destroy
    @reading_list.destroy
    redirect_to user_reading_lists_path
  end

  private

  def reading_list_params
    params.require(:reading_list).permit(:name, :user_id)
  end

  def set_reading_list
    @reading_list = ReadingList.find(params[:id])
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to save"
      redirect_to new_user_session_path
    end
  end
end
