class ArtsController < ApplicationController
  def index
    @arts = Art.all
    @arts = Art.order('created_at DESC')
  end

  def new
    @art = Art.new
  end

  def create
    @art = Art.create(illustration_params)
    if @art.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @art = Art.find(params[:id])
    @comments = Comment.order('comment DESC')
  end

  private

  def illustration_params
    params.require(:art).permit(:image, :title, :text, :age_limit).merge(user_id: current_user.id)
  end
end
