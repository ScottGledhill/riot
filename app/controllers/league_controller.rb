class LeagueController < ApplicationController

  def index
    p params
    if !params.nil?
      @summon = Summoner.new
      @summon.retrieve_summoner_name(params)
      @gang = CrowGang.new
      @gang.use_model
      @seven = Seven.new
      @seven.use_model
    else
      redirect_to('league#index')
    end
  end
end
