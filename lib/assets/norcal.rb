# --------------------------------------------
# NorCal
# --------------------------------------------

# url
norcalUrl = "http://www.norcalcrossfit.com/wod/"
norcal = Nokogiri::HTML(open(norcalUrl))

# wod
norcalWod = norcal.css(".summary-content").first
norcalDesc = norcalWod.css(".summary-excerpt").to_s

# date
norcalDate = norcalWod.css(".summary-title a").xpath('@href').text
norcalDateAdjust = norcalDate.match('(\d+)[-.\/](\d+)[-.\/](\d+)').to_s
norcalFormattedDate = Date.strptime(norcalDateAdjust, '%Y/%m/%d')

Wod.create(title: "", description: norcalDesc, date: norcalFormattedDate, box_id: 4)
