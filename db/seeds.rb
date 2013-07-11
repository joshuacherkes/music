# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


bands = ["Boards of Canada", "Blink 182", "Van Halen",
  "Panic at the Disco", "Falty DL"]

bands.each do |name|
  Band.create({
    name: name
  })
end

bands.each_with_index do |name, index|
  Album.create({
    name: name,
    band_id: (index + 1),
    env: "studio"
  })
end

bands.length.times do |alb_id|
  12.times do |num|
    Track.create({
      ord: (num + 1),
      name: SecureRandom.base64(5),
      album_id: (alb_id + 1)
    })
  end
end