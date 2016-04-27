class LeagueController < ApplicationController

  def index
    @gang = CrowGang.new
    gang.call
    gang.wins
    gang.losses
  end
end
