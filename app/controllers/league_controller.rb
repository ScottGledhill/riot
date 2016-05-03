class LeagueController < ApplicationController

  def new
    @params = params[:q]
    p @params
  end

  def index
    @gang = CrowGang.new
    @gang.call
    @gang.wins
    @gang.losses

    @seven = Seven.new
    @seven.call
    @seven.wins
    @seven.losses
  end

end
