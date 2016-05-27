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
    @summon.summoner_lane
    @summon.more_stats
  end
end


#display all champ info when click through to another page
#https://euw.api.pvp.net/api/lol/euw/v1.3/stats/by-summoner/85098161/summary?season=SEASON2016&api_key=#{ENV['LOL_KEY']}

#show division, show if on hotstreak
#https://euw.api.pvp.net/api/lol/euw/v2.5/league/by-summoner/85098161?api_key=f9448b37-6deb-4972-b949-818de948e8a7
