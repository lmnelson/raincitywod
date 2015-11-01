desc "Fetches WODS from websites"
task :fetch_wod => :environment do

  require 'nokogiri'
  require 'open-uri'
  require 'openssl'

  # boxes
  require 'assets/crossfit_official'
  require 'assets/mayhem'
  require 'assets/raincity'

end