require 'pry'
# Voici ton programme

# Appelle la gem dotenv
require 'dotenv'

# Ceci appelle le fichier .env grâce à la gem dotenv, et enregistre toutes les données enregistrées dans une hash ENV
Dotenv.load

# Il est très facile d'appeler les données sensibles du fichier .env, par exemple là je vais afficher TWITTER_API_SECRET
puts ENV['TWITTER_API_SECRET']

require 'twitter'

# quelques lignes qui enregistrent les clés d'APIs
client = Twitter::Streaming::Client.new do |config|
 config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_ACCES_TOKEN_KEY"]
  config.access_token_secret = ENV["TWITTER_ACCES_SECRET_TOKEN_KEY"]
end

topics = ["coffee", "tea"]
client.filter(track: topics.join(",")) do |object| 
  puts object.text if object.is_a?(Twitter::Tweet)
end
