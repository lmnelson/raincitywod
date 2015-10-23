desc "Fetch WOD"
task :fetch_wod => :environment do
  require 'nokogiri'
  require 'open-uri'

  # Fetch and parse HTML document
  doc = Nokogiri::HTML(open('https://raincityathletics.zenplanner.com/zenplanner/portal/leaderboard-day.cfm?objectId=2F36710B%2DC118%2D4120%2DB690%2D4D83F5FF6327&FRAME=true'))

  # wod
  wod = doc.css(".workout")

  # Create WOD
  Wod.create(title: "", description: wod)

end