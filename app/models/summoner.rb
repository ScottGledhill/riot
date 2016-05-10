class Summoner < ActiveRecord::Base

  def retrieve_summoner_name_from_id(params)
    @params_name = params[:q]
    @params = params[:q].downcase.to_sym
    @name = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.4/summoner/by-name/#{@params}?api_key=#{ENV['LOL_KEY']}")
    rescue
    if @name
      @summoner = JSON.parse(@name)[@params.to_s]["id"]
      summoner_call
    end
  end

  def summoner_name
    @params_name
  end

  def summoner_call
    @client = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.3/stats/by-summoner/#{@summoner}/summary?season=SEASON2016&api_key=#{ENV['LOL_KEY']}")
  end

  def wins
    @wins = JSON.parse(@client)["playerStatSummaries"].select {|hash| hash.has_value?("RankedSolo5x5")}[0]["wins"]
    rescue
  end

  def losses
    @losses = JSON.parse(@client)["playerStatSummaries"].select {|hash| hash.has_value?("RankedSolo5x5")}[0]["losses"]
    rescue
  end
end
