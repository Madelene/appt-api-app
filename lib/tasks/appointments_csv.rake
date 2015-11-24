require 'csv'

namespace :appointments_csv do
  desc "imports data from csv file"
  task :create_appointments => :environment do #run environment before my task
  filename = File.join Rails.root, 'appt_data.csv'
     csv_text = File.read(filename)
     csv = CSV.parse(csv_text, :headers => true)
     csv.each do |row|
    Appointment.create!(row.to_hash)
    end
  end
end

# namespace :import do
#   desc "imports data from csv file"
#   task :data => :environment do
#     require 'csv'
#     CSV.foreach('apptapiapp/app/csv/app_data.csv') do |row|

#   end
# end