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

def get_random_words(word_type) # dictionary_def, frequency)

  Wordnik.configure do |config|
      config.api_key = "#{ENV["API_KEY"]}"
  end

  types_to_exclude = parts_of_speech
  types_to_exclude.delete(word_type)
  types_to_exclude

  # word_list = Wordnik.words.get_random_words(
  #
  # )

end

def parts_of_speech
  pos = ["noun",
        "adjective",
        "verb",
        "adverb",
        "interjection",
        "pronoun",
        "preposition",
        "abbreviation",
        "affix",
        "article",
        "auxilliary-verb",
        "conjunction",
        "definite-article",
        "family-name",
        "given-name",
        "idiom",
        "imperative",
        "noun-plural",
        "noun-possessive",
        "past-participle",
        "phrasal-prefix",
        "proper-noun",
        "proper-noun-plural",
        "proper-noun-possessive",
        "suffic",
        "verb-intransitive",
        "verb-transitive"]
end


get '/' do

  definition = get_random_words("noun")

  erb :index, locals: { definition: definition }
end
