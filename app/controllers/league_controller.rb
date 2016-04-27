class LeagueController < ApplicationController

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
