class Summoner < ActiveRecord::Base

  def create
    @client = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.3/stats/by-summoner/#85098161/summary?season=SEASON2016&api_key=#{ENV['LOL_KEY']}")

    # @client = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.3/stats/by-summoner/#{@summoner_id}/summary?season=SEASON2016&api_key=#{ENV['LOL_KEY']}")
  end

  def search_query
    @summoner_id = Summoner.new(user_params[:searchbox])
  end

  def user_params
    params.require(:params).permit(:searchbox)
  end
end
