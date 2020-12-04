# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts 'destroying everything'
User.destroy_all
Movie.destroy_all
Star.destroy_all
Director.destroy_all

puts 'All Destroyed !!'
puts '-----------------'

puts 'creating users'
userone = User.create!(first_name: 'Can', last_name: 'Cimenser', email: 'can@gmail.com', password: '123456')
usertwo = User.create!(first_name: 'Meriç', last_name: 'Yılmaz', email: 'meric@gmail.com', password: '123456')
userthree = User.create!(first_name: 'Dicle', last_name: 'Yılmaz', email: 'dicle@gmail.com', password: '123456')
userfour = User.create!(first_name: 'Ömer', last_name: 'Aygen', email: 'omer@gmail.com', password: '123456')
puts 'Users Created!!'

puts 'creating movies'
movieone = Movie.create!(title: 'The Undoing', year: 2020, genre: 'horror', summary:'Life for a successful therapist in New York begins to unravel on the eve of publishing her first book.', imdb_score: 7.7, catego:'TV series', origin: 'USA', languange: 'English')
puts 'Movies created!!'

fileone = URI.open('https://res.cloudinary.com/ds2odybte/image/upload/v1606935714/Undoing_xofsnp.jpg')
filevideoone = URI.open('https://youtu.be/if-VE8A4aK0')

movieone.photo.attach(io: fileone, filename:'undoing.jpeg', content_type: 'videos/mp4')
movieone.video.attach(io: filevideoone, filename:'undoing.mp4', content_type: 'videos/mp4')

puts 'creating stars'
starone = Star.create!(fullname: 'Hugh Grant', birthyear: 1960, minibio: "Hugh Grant, one of Britain's best known faces, has been equally entertaining on-screen as well as in real life, and has had enough sense of humor to survive a media frenzy. He is known for his roles in Four Weddings and a Funeral (1994), with Andie MacDowell, Notting Hill (1999), opposite Julia Roberts, and Music and Lyrics (2007), opposite Drew Barrymore, among his other works.", nationality: 'UK', top_movies: 'Notting Hill, About a boy, Four Weddings and a Funeral, Love Actually', height:178, movie: movieone)
puts 'Stars created!!'

puts 'ALL DONE!!'
