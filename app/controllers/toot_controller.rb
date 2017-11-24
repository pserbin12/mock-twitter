class TootController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  end

  def timeline
    ids = current_user.following
    ids.push(current_user.id.to_s)
    @toots = Toot.toots_for(ids)
  end

end
