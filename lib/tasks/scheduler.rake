require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper

desc "Fetches WODS from websites"
task :fetch_wod => :environment do

  require 'nokogiri'
  require 'open-uri'
  require 'openssl'

  # boxes
  require 'assets/crossfit_official'
  require 'assets/mayhem'
  require 'assets/raincity'
  require 'assets/norcal'

end


task :fetch_wod_test => :environment do

  require 'nokogiri'
  require 'open-uri'
  require 'openssl'

  raincityTomorrowWodDate = Time.now.tomorrow.strftime("%Y-%m-%d")

  def getWod(url, element)
    webpage = Nokogiri::HTML(open(url))
    wod = webpage.css(element).to_s
    puts wod
  end

  toScrape = [
    {
      url: "https://raincityathletics.sites.zenplanner.com/leaderboard-day.cfm?CFID=80921738-1789-40bd-93e4-0b4620314449&CFTOKEN=0&jsessionid=3CF844281959DC472AB104143A507B7C&date=#{raincityTomorrowWodDate}&frame=true",
      element: ".workout"
    },
    {
      url: "http://www.crossfitmayhem.com/category/wod/",
      element: ".entry-content"
    }
  ]

  toScrape.each do |websites|
    url = websites.values.first
    element = websites.values.second
    getWod(url, element)
  end


  # def lastWod(boxId)
  #   Wod.where(box_id: boxId).last.description
  # end

  # def createWod()

  # end

end