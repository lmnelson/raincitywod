desc "Fetch WOD"
task :fetch_wod => :environment do
  require 'nokogiri'
  require 'open-uri'

  # --------------------------------------------
  # Raincity Athletics
  # --------------------------------------------

  ##
  # Rake Task to check for tomorrows WOD.
  # If there is no WOD (empty string), no WOD will be created.
  # If the content is the same as the last WOD, no WOD will be created.
  # This allows us to run the job every 10 minutes and no duplicates will be created


  # TODO: If the WOD is not created the day before this will not work.
  #       Show a placeholder 'waiting for WOD to be posted'


  # Raincity uses the 2015-11-30 date format in their url
  # This converts tomorrows date into 'y-m-d' to pass into string
  raincityTomorrowWodDate = Time.now.tomorrow.strftime("%Y-%m-%d")
  raincityUrl = "https://raincityathletics.sites.zenplanner.com/leaderboard-day.cfm?CFID=80921738-1789-40bd-93e4-0b4620314449&CFTOKEN=0&jsessionid=3CF844281959DC472AB104143A507B7C&date=#{raincityTomorrowWodDate}&frame=true"

  # Fetch Raincity WOD
  doc = Nokogiri::HTML(open(raincityUrl))

  # Finds correct div on Raincity site
  wod = doc.css(".workout").to_s

  # Get last WOD description to check for duplicates.
  lastWod = Wod.all.last.description

  # Check that this WOD content is not the same as the last.
  def duplicateWod?(thisWod, lastWod)
    thisWod == lastWod
  end

  # Create WOD if present and not duplicate
  if wod.present? && !duplicateWod?(wod, lastWod)
    Wod.create(title: "", description: wod, date: raincityTomorrowWodDate)
  end


end