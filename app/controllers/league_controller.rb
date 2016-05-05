class LeagueController < ApplicationController

  def index
    if params.include?(:q)
      @summon = Summoner.new
      @summon.retrieve_summoner_name_from_id(params)
      model_call
      render action: "summoner"
    else
      model_call
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

  def model_call
    seven
    crowgang
  end
end



# fix wins and losses method so grab ranked solo
# fix handling errors, with flash notice
# make actual searchbox work
# make multiple searches, html class, persist past searches?
# rescale previous searches to fit the page better, html class?
#
