require 'csv'
require 'pp'
require_relative 'person'

class PersonParser
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def people
    if @people
      return @people
    else
      @people = parse_people_from_file
    end
  end

  def create_people_objects
    people.map! {|person| Person.new(person)}
  end

  private

  def parse_people_from_file
    people = []
    CSV.foreach(@file, :headers => true, :header_converters => :symbol, :converters => :all) do |row|
      people << Hash[row.headers[0..-1].zip(row.fields[0..-1])]
    end
    people
  end

end


# frank driver code
test = PersonParser.new('people_fake_data.csv')
pp test.create_people_objects

# dom driver code

# people = {}
# # DRIVER
#     CSV.foreach("people_fake_data.csv", :headers => true, :header_converters => :symbol, :converters => :all) do |row|
#       people[row.fields[0]] = Hash[row.headers[0..-1].zip(row.fields[0..-1])]
#     end


# pp people
