require 'sinatra'
require 'json'

configure do
  require 'redis'
  uri = URI.parse(ENV["REDISTOGO_URL"])
  REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

post '/write' do
  content_type :json
  REDIS.lpush('songs', params[:name])
  params[:name].to_json
end

get '/songs' do
  content_type :json
  REDIS.lrange('songs', 0, -1).to_json
end