require 'pry'
class ApprovalRatings::CLI
  def call
    start
  end

  def list
    puts ""
    puts "************* Now Playing in Theatres *************"
    puts ""
    ApprovalRatings::Rating.all.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.name} on #{movie.date}" 
    end
    puts ""
  end

  def print_movie(movie)
    movie.each do |movie|

      puts ""
      puts "-------------- #{movie.name} --------------"

      puts ""
      puts "poll date"
      puts movie.date
      puts "pollster grade"
      puts movie.summary
      puts ""
      puts "approval rating"
      puts movie.approval
      puts ""
      puts "disapproval rating"
      puts movie.disapproval
      puts ""
    end
  end

  def print_movie_i(movie)   

      puts ""
      puts "-------------- #{movie.name} --------------"

      puts ""
      puts "poll date"
      puts movie.date
      puts "pollster grade"
      puts movie.summary
      puts ""
      puts "approval rating"
      puts movie.approval
      puts ""
      puts "disapproval rating"
      puts movie.disapproval
      puts ""
    
  end

  def start
    list
    input = nil
    while input != "exit"
      puts ""
      puts "What movie would you more information on, by name or number?"
      puts ""
      puts "Enter list to see the movies again."
      puts "Enter exit to end the program."
      puts ""
      input = gets.strip
      if input == "list"
        list
      

      elsif input.to_i == 0
        if movie = ApprovalRatings::Rating.find_by_name(input)
          puts "#{movie}"
          print_movie(movie)
          
        end 
      elsif input.to_i > 0
        if movie = ApprovalRatings::Rating.find(input.to_i)
          print_movie_i(movie)
        end
      end
    end
    puts "Goodbye!!!"
  end


end
