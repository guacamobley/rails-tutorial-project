class TagsController < ApplicationController

  def require_login

    unless current_user
      flash.notice = "must be logged in to delete tags."
      redirect_to tags_path
      return false
    end
  end

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash.notice = "Tag '#{@tag}' Deleted!"

    redirect_to tags_path


  end

  before_action :require_login, only: [:destroy]

end
