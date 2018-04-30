class ReadingListsController < ApplicationController
  before_action :require_login

  def index
  end

  def new
    @reading_list = ReadingList.new
  end

  def create
    #binding.pry
    @reading_list = ReadingList.create(name: params[:reading_list][:name], user_id: current_user.id)
    if @reading_list.save
      redirect_to user_reading_list_path(current_user.id, @reading_list)
    else
      render :new
    end
  end

  def show
    @reading_list = ReadingList.find(params[:id])
  end

  def edit
    @reading_list = ReadingList.find(params[:id])
  end

  def update
    @reading_list = ReadingList.find(params[:id])
    @reading_list.update(name: params[:reading_list][:name])
    redirect_to user_reading_list_path(current_user.id, @reading_list)
  end

  def destroy
    ReadingList.find(params[:id]).destroy
    redirect_to user_reading_lists_path
  end

  private

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to save"
      redirect_to new_user_session_path
    end
  end
end
