class StaticController < ApplicationController
  def home
    if signed_in?
      @keyword = current_user.keywords.build
      @prayer = current_user.prayers.build
      #@feed_items = current_user.feed.paginate( page: params[:page] )
      @feed_items = Prayer.where( :public => true, :ptype => 1 ).paginate( page: params[:page] )
    end
  end

  def help
  end

  def about
  end

  def contact
  end

end
