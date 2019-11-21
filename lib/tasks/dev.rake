namespace(:dev) do
  desc "Hydrate the database with some dummy data to look at so that developing is easier"
  task({ :prime => :environment}) do
    User.destroy_all
    Flight.destroy_all

    alice = User.new
    alice.email = "alice@example.com"
    alice.password = "password"
    alice.phone_number = "+16312356042"
    alice.save

    10.times do
      f = Flight.new
      f.description = Faker::Address.city
      f.departs_at = 24.hours.from_now + rand(600)
      f.user_id = alice.id
      f.save
    end
  end
end
