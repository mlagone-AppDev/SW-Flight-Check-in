task :send_sms => :environment do
  Flight.where({ :message_sent => false }).where("departs_at < ?", 24.hours.from_now + 10.minutes)

  #get code from umbrella exercise
end