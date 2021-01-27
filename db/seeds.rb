require 'open-uri'

puts 'destroying everything'
User.destroy_all
Movie.destroy_all
Star.destroy_all
Director.destroy_all
Review.destroy_all
Forum.destroy_all
Post.destroy_all

puts 'All Destroyed !!'
puts '-----------------'
Kernel.sleep(2)

puts 'creating users'
userone = User.create!(first_name: 'Can', last_name: 'Cimenser', email: 'can@gmail.com', password: '123456')
usertwo = User.create!(first_name: 'Meriç', last_name: 'Yılmaz', email: 'meric@gmail.com', password: '123456')
userthree = User.create!(first_name: 'Dicle', last_name: 'Yılmaz', email: 'dicle@gmail.com', password: '123456')
userfour = User.create!(first_name: 'Ömer', last_name: 'Aygen', email: 'omer@gmail.com', password: '123456')
puts 'Users Created!!'

puts 'creating movies'
movieone = Movie.create!(title: 'The Undoing', year: 2020, genre: 'horror', summary:'Life for a successful therapist in New York begins to unravel on the eve of publishing her first book.', imdb_score: 7.7, catego:'TV series', origin: 'USA', languange: 'English')
movietwo = Movie.create!(title: 'Westworld', year: 2016, genre: 'Drama, Mystery, Sci-Fi', summary:'Set at the intersection of the near future and the reimagined past, explore a world in which every human appetite can be indulged without consequence.', imdb_score: 8.7, catego: 'TV series', origin: 'USA', languange: 'English')
moviethree = Movie.create!(title:"The Spy", year: 2019, genre: "Drama, History", summary: "Based on the life of the Israeli spy, Eli Cohen.", imdb_score: 7.9, catego: 'TV series', origin: "France", languange: "English")
puts 'Movies created!!'

fileone = URI.open('https://res.cloudinary.com/ds2odybte/image/upload/v1606935714/Undoing_xofsnp.jpg')
filetwo = URI.open('https://res.cloudinary.com/ds2odybte/image/upload/v1611747541/westworld_z4sukl.jpg')
filethree = URI.open('https://res.cloudinary.com/ds2odybte/image/upload/v1611747616/The_Spy_jovufs.jpg')
filevideoone = URI.open('https://youtu.be/if-VE8A4aK0')

puts 'attaching pics'
movieone.photo.attach(io: fileone, filename:'undoing.jpeg', content_type: 'photos/jpeg')
movietwo.photo.attach(io: filetwo, filename:'westworld.jpeg', content_type: 'photos/jpeg')
moviethree.photo.attach(io: filethree, filename:'spy.jpeg', content_type: 'photos/jpeg')
puts 'pics attached'
movieone.video.attach(io: filevideoone, filename:'undoing.mp4', content_type: 'videos/mp4')

puts 'creating stars'
starone = Star.create!(fullname: 'Hugh Grant', birthyear: 1960, minibio: "Hugh Grant, one of Britain's best known faces, has been equally entertaining on-screen as well as in real life, and has had enough sense of humor to survive a media frenzy. He is known for his roles in Four Weddings and a Funeral (1994), with Andie MacDowell, Notting Hill (1999), opposite Julia Roberts, and Music and Lyrics (2007), opposite Drew Barrymore, among his other works.", nationality: 'UK', top_movies: 'Notting Hill, About a boy, Four Weddings and a Funeral, Love Actually', height:178, movie:movieone)
puts 'Stars created!!'

puts 'creating directors'
directorone = Director.create!(fullname: 'Susanne Bier', birthyear: 1960, minibio: "Though Academy Award®, Golden Globe Award and Emmy Award winning writer and director Susanne Bier's films often play out against a wide-reaching global backdrop, their focus is intimate, carefully exploring the explosive emotions and complexities of familial bonds. This unique combination is part of the formula that has made her Denmark's leading female filmmaker and a powerhouse worldwide.", nationality: "Denmark", top_movies:"BirdBox, The Undoing, Haevnen", movie:movieone)
puts 'Directors created!'

puts 'creating reviews'
reviewone = Review.create!(content: 'Very exciting story', rating: 8.0, user:userone, movie:movieone)
reviewtwo = Review.create!(content: 'Good acting, good story telling', rating: 7.0, user:usertwo, movie:movietwo)
puts 'reviews created!'

puts 'creating forums'
forumone = Forum.create!(title: 'Best Tom Cruise Movies', description: 'Share your favorite Tom Cruise movies in this forum')
puts 'Forums created!'

puts 'creating posts'
postone = Post.create!(title:"Canakin's favorite Cruise movies", content:"Top Gun, MI series, especially 4 to 6, Minority Report", forum: forumone, user: userone)
puts 'Posts created!'

Kernel.sleep(2)
puts 'ALL DONE!!'
