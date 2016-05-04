namespace :dev do

  desc "Rebuild system"
  # task :rebuild => ["db:drop", "db:setup", :fake]

  task :dropdb => :environment do
    puts "delete Post and Photo....."
    Post.delete_all
    Photo.delete_all
  end

  task :fakeuser => :environment do
    puts "Create fake data for development"
    u = User.new( :login => "root", :password => "password", :email => "root@example.com", :name => "管理員")
    u.save!
  end

  task :fakepost => :environment do
    puts "Create fake data for development!"
    20.times do |n|
      post = Post.create(
                          :title => Faker::Lorem.sentence(1),
                          :origin => Faker::Address.country,
                          :destination => Faker::Address.country,
                          :description =>Faker::Lorem.paragraph(4),
                          :trip_date => Faker::Date.backward(30),
                          :distance => Faker::Number.decimal(3.1)
                          )
      5.times do
        post.photos.create(
          :photo_location => Faker::Address.country,
          # :pic => open("http://Users/BigBoss/Pictures/booking_system/1/44283_62269_935352.jpg")
          :pic =>File.new("/Users/BigBoss/Pictures/booking_system/1/44283_62269_935352.jpg")
        )
      end
    end
  end
end

# "origin"
#     t.string   "destination"
#     t.date     "trip_date"
#     t.float    "distance"
#     t.text     "description"

#     user = User.create( :email => email, :password => "12345678", :image => Faker::Avatar.image)
#       user.create_coach(
#           :coach_name => Faker::Name.name,
#           :contact_email => Faker::Internet.email,
#           :contact_phone => Faker::PhoneNumber.phone_number,
#           :info => "XXXX體適能協會合格教官 , ABC健身俱樂部體適能教練, (寫過的文章、部落格LINK)",
#           :description => Faker::Lorem.paragraph,
#           :certificate => "職業證照",
#           :teaching_frame => "「樂在學習，關心他人」。希望學生可以在學習中快樂的學習知識，懂得關心他人，對別人好。最終目的是懂得關心他人，學好「做人處世」。"
#         )
#     end
#      100.times do |n|
#        headline = Faker::Lorem.sentence(3)
#        video = Faker::Lorem.words(5)
#        Video.create!(:headline => headline,
#                    :video => video)
#      end