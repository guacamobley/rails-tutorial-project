class CommentsController < ApplicationController
  include CommentsHelper

  def require_login
    unless current_user
      flash.notice = "must be logged in to edit/delete comments."
      redirect_to articles_path
      return false
    end
  end



  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.save

    redirect_to article_path(@comment.article)
  end

  before_action :require_login, except: [:create]

end
