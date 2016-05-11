class LeagueController < ApplicationController

  def index
    if params.include?(:q)
      summoner
      model_call
      render action: "summoner"
    else
      model_call
      render action: "index"
    end
  end

  private

  def scottystarburst
    @scotty = ScottyStarburst.new
    @scotty.use_model
  end

  def crowgang
    @gang = CrowGang.new
    @gang.use_model
  end

  def model_call
    scottystarburst
    crowgang
  end

  def summoner
    @summon = Summoner.new
    @summon.retrieve_summoner_name_from_id(params)
    @summon.avatar
  end
end



# fix handling errors, with flash notice
# make actual searchbox work
# make multiple searches, html class, persist past searches?
# rescale previous searches to fit the page better, html class?
#
