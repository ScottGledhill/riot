class LeagueController < ApplicationController

  def index
    if !params.nil?
      retrieve_summoner_name
      @gang = CrowGang.new
      @gang.use_model
      @seven = Seven.new
      @seven.use_model
    else
      redirect_to('league#index')
    end
  end

  def retrieve_summoner_name
    @params = params[:q]
    @params_adjusted = @params.to_sym
    @name = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.4/summoner/by-name/#{@params_adjusted}?api_key=#{ENV['LOL_KEY']}")
    p @summoner = JSON.parse(@name)[@params]["id"]
  end

  def summoner_call
    @client = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.3/stats/by-summoner/#{@summoner}/summary?season=SEASON2016&api_key=#{ENV['LOL_KEY']}")
    @loss = JSON.parse(@client)["playerStatSummaries"][2]["losses"]
    @win = JSON.parse(@client)["playerStatSummaries"][2]["wins"]
  end
end


#call should grab whichever is searched and make an api call with it, now just
#display it on the page along side the others
