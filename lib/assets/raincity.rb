# --------------------------------------------
# Raincity Athletics
# --------------------------------------------

# Raincity uses the 2015-11-30 date format in their url
# This converts tomorrows date into 'y-m-d' to pass into string
raincityTomorrowWodDate = Time.now.tomorrow.strftime("%Y-%m-%d")

# URL to fetch
raincityUrl = "https://raincityathletics.sites.zenplanner.com/leaderboard-day.cfm?CFID=80921738-1789-40bd-93e4-0b4620314449&CFTOKEN=0&jsessionid=3CF844281959DC472AB104143A507B7C&date=#{raincityTomorrowWodDate}&frame=true"
raincity = Nokogiri::HTML(open(raincityUrl))

##
# Rake Task to check for tomorrows WOD.
# If there is no WOD (empty string), no WOD will be created.
# If the content is the same as the last WOD, no WOD will be created.
# This allows us to run the job every 10 minutes and no duplicates will be created

# TODO: If the WOD is not created the day before this will not work.
#       Show a placeholder 'waiting for WOD to be posted'
#       Create seed file.

# Finds correct div on Raincity site
raincityWod = raincity.css(".workout").to_s

# Get last WOD description to check for duplicates.
# Needs to be 1 WOD in database to work.
raincityLastWod = Wod.where('box_id = 1').last.description

# Check that this WOD content is not the same as the last.
def duplicateWod?(thisWod, lastWod)
  thisWod == lastWod
end

# Create WOD if present and not duplicate
if raincityWod.present? && !duplicateWod?(raincityWod, raincityLastWod)
  Wod.create(title: "", description: raincityWod, date: raincityTomorrowWodDate, box_id: 1)
end
