# --------------------------------------------
# CrossFit Mayhem
# --------------------------------------------

require 'date'

mayhemUrl = "http://www.crossfitmayhem.com/category/wod/"
mayhem = Nokogiri::HTML(open(mayhemUrl))

mayhemWod = mayhem.css("article").first
mayhemWod.search(".sharedaddy").remove

mayhemDate = mayhemWod.css(".entry-title a").text.to_s
mayhemFormatedDate = Date.strptime(mayhemDate, '%m/%d/%Y')
mayhemDesc = mayhemWod.css(".entry-content").to_s

# Get last WOD description to check for duplicates.
# Needs to be 1 WOD in database to work.
mayhemLastWod = Wod.where('box_id = 2').last.description

# Check that this WOD content is not the same as the last.
def duplicateWod?(thisWod, lastWod)
  thisWod == lastWod
end

# Create WOD if present and not duplicate
if !duplicateWod?(mayhemDesc, mayhemLastWod)
  Wod.create(title: "", description: mayhemDesc, date: mayhemFormatedDate, box_id: 2)
end
