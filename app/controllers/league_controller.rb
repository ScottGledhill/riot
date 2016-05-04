class LeagueController < ApplicationController

  def index
    if params.include?(:q)
      @summon = Summoner.new
      @summon.retrieve_summoner_name_from_id(params)
      model_call
    else
      model_call
      render action: "index"
    end
  end

  private

  def model_call
    seven
    crowgang
  end

  def seven
    @seven = Seven.new
    @seven.use_model
  end

  def crowgang
    @gang = CrowGang.new
    @gang.use_model
  end
end
