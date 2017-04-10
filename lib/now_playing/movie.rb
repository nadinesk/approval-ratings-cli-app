require 'pry'
require 'openssl'
   OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class NowPlaying::Movie

  attr_accessor :name, :date, :url, :summary, :stars

  def initialize(name = nil, date = nil)
    @name = name
    @date = date
  end

  def self.all

    @@all ||= scrape_now_playing

  end

  def self.find(id)
    self.all[id-1]
  end

  def self.find_by_name(name)
    self.all.detect do |m|
      m.name.downcase.strip == name.downcase.strip ||
      m.name.split("(").first.strip.downcase == name.downcase.strip
    end
  end

  def summary
    @summary ||= plot_summary_doc.search("p.plotSummary").text.strip
  end

  def stars
    @stars ||= doc.search("div[itemprop='actors'] span[itemprop='name']").collect{|e| e.text.strip}.join(", ")
  end

  private
    def self.scrape_now_playing

      doc = Nokogiri::HTML(open('https://projects.fivethirtyeight.com/trump-approval-ratings/'))
      #names = doc.css("td.pollster").text
      #names.collect{|e| new(e.text.strip, "http://imdb.com#{e.attr("href").split("?").first.strip}")}

      pollsters = []
      doc.css("tbody tr").each do |pollster|
        pollster_name = pollster.css(".pollster a").text
        pollster_date = pollster.css(".dates").text
        # puts "pollster #{pollster}"
        new_pollster = new(pollster_name, pollster_date)
        pollsters << new_pollster unless pollsters.include?(new_pollster.name)

      end
      pollsters

    end

    def plot_summary_doc
      @plot_summary_doc ||= Nokogiri::HTML(open("#{self.url}plotsummary"))
    end

    def doc
      @doc ||= Nokogiri::HTML(open(self.url))
    end

end
