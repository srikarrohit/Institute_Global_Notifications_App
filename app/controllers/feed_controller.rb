class FeedController < ApplicationController
  def index
  	url = "http://www.t5eiitm.org/feed/"
    @feed = Feedjira::Feed.fetch_and_parse url
  end
end
