class Summoner

  def retrieve_summoner_name_from_id(params)
    @params_name = params[:q]
    @params = params[:q].downcase.to_sym
    searched_name_call
    if @name
      @summoner = JSON.parse(@name)[@params.to_s]["id"]
      summoner_call
    end
  end

  def searched_name_call
    @name = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.4/summoner/by-name/#{@params}?api_key=#{ENV['LOL_KEY']}")
    rescue
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

  def avatar
    byebug
    champ_name
    @most_played_champ_id = JSON.parse(champ_call)[0]["championId"]
    @champ = JSON.parse(champ_name)
  end

  def champ_id
    RestClient.get("https://euw.api.pvp.net/championmastery/location/EUW1/player/#{@summoner}/champions?api_key=28de0f6c-0011-456e-8342-7ca77b61ddff")
  end

  def champ_name
    RestClient.get("https://global.api.pvp.net/api/lol/static-data/euw/v1.2/champion/103?api_key=#{ENV['LOL_KEY']}")
  end
end
