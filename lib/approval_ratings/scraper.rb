class ApprovalRatings::Scraper


	 def self.scrape_approval_ratings
      doc = Nokogiri::HTML(open('https://projects.fivethirtyeight.com/trump-approval-ratings/'))    
      #pollsters = []
      doc.css("tbody tr.hidden[data-subgroup='Adults']").each do |pollster|
        pollster_name = pollster.css("td.pollster a").text
        pollster_date = pollster.css("td.dates").text
        pollster_summary = pollster.css("div.gradeText").text
        pollster_approval = pollster.at_css("td.answer.first").text
        pollster_disapproval = pollster.at_css("td.answer.last").text
        # puts "pollster #{pollster}"
        new_pollster = ApprovalRatings::Rating.new(pollster_name, pollster_date, pollster_summary, pollster_approval, pollster_disapproval)
        #pollsters << new_pollster unless pollsters.include?(new_pollster.name) || pollsters.size > 19
        new_pollster.save
      end
      #pollsters
      
    end
    
    def doc
      @doc ||= Nokogiri::HTML(open(self.url))
    end

end
