namespace :appointments_csv do
  task :create_appointments => :environment do
    require 'csv'

    file = File.join(Rails.root, 'app', 'csv', 'appt_data.csv')
    csv_text = File.read(file)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Appointment.create!(row.to_hash)
    end
  end
end