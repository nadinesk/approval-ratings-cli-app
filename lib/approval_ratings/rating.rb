require 'pry'
#require 'openssl'
 #  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class ApprovalRatings::Rating

  attr_accessor :name, :date, :url, :summary, :approval, :disapproval

  @@all = []

  def initialize(name = nil, date = nil, summary = nil, approval = nil, disapproval = nil)
    @name = name
    @date = date
    @summary = summary
    @approval = approval
    @disapproval = disapproval
    @url = 'https://projects.fivethirtyeight.com/trump-approval-ratings/'
  end

  def self.all
    @@all 
  end

  def save
    @@all << self unless @@all.size > 19
  end

  def self.find(id)
    self.all[id-1]
  end

  def self.find_by_name(name)
    self.all.find_all { |i|  i.name.downcase.strip == name.downcase.strip }  
  end

  
    
   

end
