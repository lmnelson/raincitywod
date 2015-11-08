# --------------------------------------------
# CrossFit Official
# --------------------------------------------

cfUrl = "http://www.crossfit.com/"
cf = Nokogiri::HTML(open(cfUrl))

cfDate = cf.css("tr[1] .date").first.text.strip
cfFormattedDate = Date.strptime(cfDate, '%B %e, %Y')

cfDesc = cf.css("tr[1] .blogbody").first.to_s

if !Wod.exists?(box_id: 3)
  Wod.create(title: "", description: cfDesc, date: cfDate, box_id: 3)
end


cfLastWod = Wod.where('box_id = 3').last.description

if !duplicateWod?(cfDesc, cfLastWod)
  Wod.create(title: "", description: cfDesc, date: cfDate, box_id: 3)
end