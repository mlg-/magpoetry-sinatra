require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'wordnik'
require 'dotenv'

Dotenv.load

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

def wordnik
  Wordnik.configure do |config|
      config.api_key = "#{ENV["API_KEY"]}"
  end

  definition = Wordnik.words.get_random_words(:limit => 5)

end


get '/' do

  definition = wordnik

  erb :index, locals: { definition: definition }
end
