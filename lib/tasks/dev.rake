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
                          :distance => Faker::Number.decimal(3.1))
      5.times do
        post.photos.create(
          :photo_location => Faker::Address.country,
          # :pic => open("http://Users/BigBoss/Pictures/booking_system/1/44283_62269_935352.jpg")
          :pic =>File.new("/Users/BigBoss/Pictures/booking_system/1/44283_62269_935352.jpg"))
      end
    end
  end
  task :insert_distance => :environment do
    @post=Post.all
    puts "#{@post.count}"
    @post.each_with_index do |p, i|
      p.update(
        :distance => Faker::Number.decimal(4.1)
        # puts "[#{i}]: Post.#{p.id} #{:distance}!"
      )
      puts "[#{i}]: Post.#{p.id} done!"
    end
  end
end