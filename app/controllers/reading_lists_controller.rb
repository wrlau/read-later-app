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
  end

  def update
  end

  def show
    @reading_list = ReadingList.find(params[:id])
  end

  private
=begin
  def reading_list_params
    params.require(:reading_list).permit(:name)
  end
=end
  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to save"
      redirect_to new_user_session_path
    end
  end
end
