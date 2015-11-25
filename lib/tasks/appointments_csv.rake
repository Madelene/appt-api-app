require 'csv'


namespace :appointments_csv do
  desc "imports data from csv file"
  task :create_appointments => :environment do #run environment before my task
    filename = File.join(Rails.root, 'app', 'migrate', 'appt_data.csv')
       csv_text = File.read(filename)
       csv = CSV.parse(csv_text, :headers => true)
       csv.each do |row|
        Appointment.create!(row.to_hash)
    end
  end
end

