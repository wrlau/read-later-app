class ReadingListsController < ApplicationController
  before_action :require_login

  def index
  end

  def new
    @reading_list = ReadingList.new
  end

  def create
    @reading_list = ReadingList.create(reading_list_params)
  end

  def update
  end

  def show
    @reading_list = ReadingList.find(params[:id])
  end

  private

  def reading_list_params
    params.require(:reading_list).permit(:name)
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to save"
      redirect_to new_user_session_path
    end
  end

end
