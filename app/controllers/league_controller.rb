class LeagueController < ApplicationController

  def index
    @gang = CrowGang.new
    @gang.call
    @gang.wins
    @gang.losses
  end

  def freeze
    @freeze = Freeze.new
    @freeze.call
    @freeze.wins
    @freeze.losses
  end
end
