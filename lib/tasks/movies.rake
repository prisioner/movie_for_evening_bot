namespace :movies do
  desc "Updates movies list from IMDB"
  task update_from_imdb: :environment do
    ImdbMoviesParser.call
  end
end
