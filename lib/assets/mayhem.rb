# --------------------------------------------
# CrossFit Mayhem
# --------------------------------------------

mayhemUrl = "http://www.crossfitmayhem.com/category/wod/"
mayhem = Nokogiri::HTML(open(mayhemUrl))

mayhemWod = mayhem.css("article").first
mayhemWod.search(".sharedaddy").remove

# date
mayhemDate = mayhemWod.css(".entry-title a").text.to_s
mayhemFormattedDate = Date.strptime(mayhemDate, '%m/%d/%Y')

mayhemDesc = mayhemWod.css(".entry-content").to_s

if !Wod.exists?(box_id: 2)
  Wod.create(title: "", description: mayhemDesc, date: mayhemFormattedDate, box_id: 2)
end


# Get last WOD description to check for duplicates.
# Needs to be 1 WOD in database to work.
mayhemLastWod = Wod.where('box_id = 2').last.description

# Create WOD if present and not duplicate
if !duplicateWod?(mayhemDesc, mayhemLastWod)
  Wod.create(title: "", description: mayhemDesc, date: mayhemFormattedDate, box_id: 2)
end
