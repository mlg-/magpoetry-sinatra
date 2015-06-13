require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'wordnik'

configure :development, :test do
  require 'pry'
end

configure do
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get '/' do
  "Hello World"
  erb :index
end
