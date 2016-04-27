class LeagueController < ApplicationController

  def index
    CrowGang.call
    CrowGang.wins
    CrowGang.losses
  end
end
