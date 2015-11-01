# --------------------------------------------
# CrossFit Official
# --------------------------------------------

cfUrl = "http://www.crossfit.com/"
cf = Nokogiri::HTML(open(cfUrl))

cfDate = cf.css("tr[1] .date").first.text.strip
cfFormattedDate = Date.strptime(cfDate, '%B %e, %Y')

cfDesc = cf.css("tr[1] .blogbody").first.to_s

cfLastWod = Wod.where('box_id = 3').last.description

def duplicateWod?(thisWod, lastWod)
  thisWod == lastWod
end

if !duplicateWod?(cfDesc, cfLastWod)
  Wod.create(title: "", description: cfDesc, date: cfDate, box_id: 3)
end