class HomeController < ApplicationController
  before_action :require_user, only: [:my]

  def index
    @posts = Post.by_hot_score
             .paginate(page: params[:page])
    @vote_hash = current_user ? Vote.vote_hash(current_user, @posts) : {}
    @newsletter_subscriber = NewsletterSubscriber.new
  end

  def my
    @posts = Post.my_phez(current_user, params[:page], to_show_premium)
    @vote_hash = Vote.vote_hash(current_user, @posts)
  end

  def latest
    @posts = Post.latest
             .paginate(page: params[:page])
    @vote_hash = Vote.vote_hash(current_user, @posts)
  end

  def privacy
  end

  def thanks
  end

  def apidocs
  end
end
