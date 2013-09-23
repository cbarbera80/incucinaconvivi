namespace :db do
  desc "Fill database with sample data"

  task populate: :environment do
    99.times do |n|
      name  = Faker::Name.name
      email = Faker::Internet.email

      Subscriber.create!(:name=>name, :email => email)
    end
  end
end
