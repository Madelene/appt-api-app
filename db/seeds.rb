# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
class DateConverter
  def self.convert(value)
    DateTime.strptime( value, '%m/%e/%y %k:%M') # parses custom date format into Date instance
  end
end

# class ActiveSupport::TimeWithZone
#     def as_json(options = {})
#         strftime('%Y-%m-%d %H:%M:%S')
#     end
# end

filename = 'db/appt_data.csv'
options = {
  :key_mapping => {:unwanted_row => nil, :old_row_name => :new_name},
  :value_converters => {:start_time => DateConverter, :end_time => DateConverter}
}

  n = SmarterCSV.process(filename, options) do |array|
      # we're passing a block in, to process each resulting hash / =row (the block takes array of hashes)
      # when chunking is not enabled, there is only one hash in each array
      Appointment.create( array.first )
  end
