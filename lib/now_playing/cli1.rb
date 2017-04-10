require 'pry'
class NowPlaying::CLI
  def call
    start
  end

  def list
    puts ""
    puts "************* Now Playing in Theatres *************"
    puts ""
    NowPlaying::Movie.all.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.name}"

    end
    puts ""
  end

  def print_movie(movie)
    puts ""
    puts "-------------- #{movie.name} --------------"

    puts ""
    puts movie.summary
    puts ""

    puts "Starring: #{movie.stars}"
    puts ""
  end

  def start
    list

    puts "Goodbye!!!"
  
end
