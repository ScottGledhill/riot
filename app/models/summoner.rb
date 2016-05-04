class Summoner < ActiveRecord::Base

  def retrieve_summoner_name_from_id(params)
    @params = params[:q].downcase
    @params_adjusted = @params.to_sym
    @name = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.4/summoner/by-name/#{@params_adjusted}?api_key=#{ENV['LOL_KEY']}")
    @summoner = JSON.parse(@name)[@params]["id"]
    summoner_call
  end

  def summoner_name
    @params
  end

  def summoner_call
    @client = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.3/stats/by-summoner/#{@summoner}/summary?season=SEASON2016&api_key=#{ENV['LOL_KEY']}")
  end

  def wins
    @wins = JSON.parse(@client)["playerStatSummaries"][2]["wins"]
  end

  def losses
    @losses = JSON.parse(@client)["playerStatSummaries"][2]["losses"]
    # p  @loss.fetch("playerStatSummaryType").fetch("RankedSolo5x5").fetch("wins")
  end
end
