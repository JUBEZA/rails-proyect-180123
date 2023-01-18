class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def show
    @video = Video.find(params[:id])
  end

  def create
    @video = Video.new(video_params)
    @video.save
    redirect_to video_path(@video)# Will raise ActiveModel::ForbiddenAttributesError
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    @video.update(video_params)
    redirect_to video_path(@video)
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to video_path(@video), status: :see_other
  end

  private

  def video_params
    params.require(:video).permit(:title, :category, :published_year)
  end

end
