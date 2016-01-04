# --------------------------------------------
# NorCal
# --------------------------------------------

require 'time'

# url
norcalUrl = "http://www.norcalcrossfit.com/wod/"
norcal = Nokogiri::HTML(open(norcalUrl))

# wod
norcalWod = norcal.css(".summary-content").first
norcalDesc = norcalWod.css(".summary-excerpt").to_s

# date
norcalDate = norcalWod.css(".summary-title a").xpath('@href').text
norcalDateAdjust = norcalDate.split('/').last.to_s
norcalDateParse = Time.parse(norcalDateAdjust)
norcalFormattedDate = norcalDateParse.strftime("%m/%d/%Y")

if !Wod.exists?(box_id: 4)
  Wod.create(title: "", description: norcalDesc, date: norcalFormattedDate, box_id: 4)
end

# Get last WOD description to check for duplicates.
# Needs to be 1 WOD in database to work.
norcalLastWod = Wod.where('box_id = 4').last.description

# Create WOD if present and not duplicate
if !duplicateWod?(norcalDesc, norcalLastWod)
  Wod.create(title: "", description: norcalDesc, date: norcalFormattedDate, box_id: 4)
end