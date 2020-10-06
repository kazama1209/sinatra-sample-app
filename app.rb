require 'sinatra'
require 'redis'
require 'json'

r = Redis.new host: ENV['REDIS_HOST'], port: '6379'

get '/' do
  'Hello World!'
end

get '/create_dummy_data' do
  {
    'test1': 'this is test 1',
    'test2': 'this is test 2',
    'test3': 'this is test 3',
    'test4': 'this is test 4'
  }.each do |key, value|
    r.set key, value 
  end

  'create successfully dummy data'
end

get '/fetch/:key' do
  data = r.get params[:key]
  return 'empty data' if data.nil?

  data
end
