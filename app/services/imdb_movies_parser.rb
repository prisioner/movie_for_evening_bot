class ImdbMoviesParser
  IMDB_URL = "https://www.imdb.com/chart/top/".freeze

  def self.call
    new.call
  end

  def call
    response = HTTParty.get(IMDB_URL)

    doc = Nokogiri::HTML(response.body)

    movie_nodes = doc.css(".titleColumn")

    movie_nodes.each do |movie_node|
      title = movie_node.css("a").text
      year = movie_node.css(".secondaryInfo").text.delete("()")

      director_name =
        movie_node
          .at("a")["title"]
          .split(",")
          .find { |el| el.include?(" (dir.)") }
          .sub(" (dir.)", "")

      director = Director.find_or_create_by(name: director_name)

      Movie.find_or_create_by(
        title: title,
        year: year,
        director: director
      )
    end
  end
end
