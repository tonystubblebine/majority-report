class ProfilesController < ApplicationController
  before_filter :set_by_id

  def show
    @posts = @user.posts.latest.paginate(page: params[:page])
  end

  def comments
    @comments = @user.comments.latest.paginate(page: params[:page])
  end

  private

  def set_by_id
    @user = User.find(params[:id])
    redirect_to(root_path, alert: 'Could not find user.') and return if @user.nil?
  end
end
