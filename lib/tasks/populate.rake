namespace :db do
  desc "Populate database with Boxes and Wods"
  task :populate => :environment do

    require 'faker'

    # Create Boxes
    10.times do |b|
      Box.create({
        name: Faker::Company.name,
        website: Faker::Internet.domain_name
      })
    end

    # Create Wods
    boxes = Box.all
    boxes.each do |x|
      10.times do |w|
        Wod.create({
          title: "",
          description: Faker::Lorem.paragraph,
          date: Faker::Time.backward(30),
          box_id: x.id
        })
      end
    end

  end
end