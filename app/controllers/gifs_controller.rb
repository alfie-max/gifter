class GifsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_gif, only: %i[show edit update destroy]

  def index
    @pagy, @gifs = pagy(Gif.recent, items: 5)
  end

  def new
    @gif = Gif.new
  end

  def create
    @gif = current_user.gifs.create(gif_params)

    if @gif.persisted?
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @gif.update(gif_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @gif.destroy
  end

  private

  def gif_params
    params.require(:gif).permit(:name, :file, :description, tag_list: [])
  end

  def set_gif
    @gif = Gif.find(params[:id])
  end
end
