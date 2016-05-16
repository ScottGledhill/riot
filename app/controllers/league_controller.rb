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


# static data
# find and save champ images
# match id to image name by same id
