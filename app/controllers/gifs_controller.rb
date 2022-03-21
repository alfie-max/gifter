class GifsController < ApplicationController
  def index
  end

  def new
    @gif = Gif.new
  end

  def create
    @gif = Gif.new(gif_params)
    if @gif.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def gif_params
    params.require(:gif).permit(:name, :file)
  end
end
