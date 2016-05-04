class LeagueController < ApplicationController

  def index
    if params.include?(:q)
    p  'running'
      @summon = Summoner.new
      @summon.retrieve_summoner_name(params)
      seven
      crowgang
    else
    p  'not running'
      seven
      crowgang
      render action: "index"
    end
  end

  private

  def seven
    @seven = Seven.new
    @seven.use_model
  end

  def crowgang
    @gang = CrowGang.new
    @gang.use_model
  end
end
