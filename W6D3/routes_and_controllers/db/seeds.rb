# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
  
  # Instructors
  elliot = User.create!(username: "all_knowing_elliot")
  ryan = User.create!(username: "will_climb_rocks")
  dean = User.create!(username: "dean_machine")
  angela = User.create!(username: "loves_capy")
  charlos = User.create!(username: "charlos_gets_buckets")
  alissa = User.create!(username: "cow_luva")
  joe = User.create!(username: "trader_joes_4lyf3")
  walker = User.create!(username: "wakka_wakka")
  mike = User.create!(username: "like_mike")
  michelle = User.create!(username: "michelle_bell")
  vanessa = User.create!(username: "the_vanessa")
  jen = User.create!(username: "jen_ken_intensifies")
  big_company = User.create!(username: "instructors_rock")

Artwork.destroy_all

  oil_painting = Artwork.create!(title: "google", image_url: "google.com", artist_id: elliot.id)
  canvas_painting = Artwork.create!(title: "Will is cool", image_url: "facebook.com", artist_id: jen.id)
  abstract_painting = Artwork.create!(title: "cool painting", image_url: "painting.com", artist_id: mike.id)
  crummy_painting = Artwork.create!(title: "crum", image_url: "vangogh.com", artist_id: michelle.id)
  
ArtworkShares.destroy_all

  share1 = ArtworkShares.create!(artwork_id: oil_painting.id, viewer_id: jen.id)
  share2 = ArtworkShares.create!(artwork_id: abstract_painting.id, viewer_id: vanessa.id)
  share4 = ArtworkShares.create!(artwork_id: crummy_painting.id, viewer_id: walker.id)
  share5 = ArtworkShares.create!(artwork_id: canvas_painting.id, viewer_id: big_company.id)