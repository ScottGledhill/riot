class LeagueController < ApplicationController

  def index
    if params.include?(:q)
      summoner_params
      avatar_params
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

  def summoner_params
    @summon = Summoner.new
    @summon.retrieve_summoner_name_from_id(params)
  end

  def avatar_params
    @avatar = Avatar.new
    @avatar.check
  end
end



# fix handling errors, with flash notice
# make actual searchbox work
# make multiple searches, html class, persist past searches?
# rescale previous searches to fit the page better, html class?
#
