class Summoner < ActiveRecord::Base

  def retrieve_summoner_name(params)
    @params = params[:q]
    @params_adjusted = @params.to_sym
    @name = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.4/summoner/by-name/#{@params_adjusted}?api_key=#{ENV['LOL_KEY']}")
    @summoner = JSON.parse(@name)[@params]["id"]
    summoner_call
  end

  def summoner_call
    @client = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.3/stats/by-summoner/#{@summoner}/summary?season=SEASON2016&api_key=#{ENV['LOL_KEY']}")
    p @loss = JSON.parse(@client)["playerStatSummaries"]
    # p  @loss.fetch("playerStatSummaryType").fetch("RankedSolo5x5").fetch("wins")
    # [2]["losses"]
    # @win = JSON.parse(@client)["playerStatSummaries"][2]["wins"]
  end
end
