require 'redis'
require 'idobata_hook'
require 'takumi/server_list_ping'

count_key = 'online_player_count'
redis = Redis.new(url: ENV['REDISTOGO_URL'])

loop do
  prev_player_count = redis.get(count_key) || 0

  status_response = Takumi::ServerListPing.ping(ENV['MINECRAFT_SERVER_ADDRESS'])

  current_player_count = status_response.info['players']['online']

  if current_player_count.to_i > prev_player_count.to_i
    player_names = status_response['players']['sample'].map {|player|
      player['name']
    }.join(', ')

    idobata_hook_client = IdobataHook::Client.new(ENV['IDOBATA_HOOK_URL'])
    idobata_hook_client.send("@all #{player_names}がマイクラはじめたみたい")
  end

  redis.set(count_key, current_player_count)

  sleep 60
end
