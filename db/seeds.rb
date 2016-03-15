# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# data
require_relative './song_data.rb'
require_relative './artist_data.rb'

Song.destroy_all
Artist.destroy_all
User.destroy_all

@test_user = User.create(username: "juan", password: "foo")

song_data = get_song_data()
artist_data = get_artist_data()

song_data.each_pair do |artist_name, songs|
  info = artist_data[artist_name]
  current_artist = Artist.create!({
    name:         info[:name],
    photo_url:    info[:photo_url],
    nationality:  info[:nationality],
    user:         @test_user
  })

  songs.each do |song|
    Song.create!({
      title:        song[:title],
      album:        song[:album],
      preview_url:  song[:preview_link],
      artist:       current_artist,
      user:         @test_user
    })
  end
end
