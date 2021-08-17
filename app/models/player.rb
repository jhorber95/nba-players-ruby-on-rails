class Player

  def get_pairs(sum)
    @players = get_players_data

    map = Hash.new
    couple_string = []

    @players.each_with_index do |player, index|
      tem = sum - player['h_in'].to_i
      
      if map.has_key?(tem)
        str = get_full_name(@players[map[tem]]) + ' - ' + get_full_name(player)
        couple_string.push(str)
      end

      map[player['h_in'].to_i] = index
    end

    return 'No matches found' if couple_string.empty?

    couple_string
  end

  private

  def get_players_data
    response = RestClient.get 'https://mach-eight.uc.r.appspot.com/', {content_type: :json}
    JSON.parse(response.body)["values"]
  end

  def get_full_name(player)
    player['first_name'] + ' '+ player['last_name']
  end
end