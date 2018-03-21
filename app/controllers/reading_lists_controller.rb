class ReadingListsController < ApplicationController

  def index
  end

  def show
    @reading_list = ReadingList.find(params[:id])
  end

end
