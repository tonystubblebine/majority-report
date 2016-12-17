class SearchController < ApplicationController
  def index
    @query = params[:query]
    #@results = PgSearch.multisearch(@query)
    # TODO: Replace PgSearch here.
    # Comment.body, 
    # Post.title/url/body
    # User.username
  end
end
