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
      @people = parse_people_objects_from_file
    end
    pp @people
    # p '*' * 50
    # @people.flatten
  end

  private
  def parse_people_objects_from_file
    people = []
    CSV.foreach("people_fake_data.csv", :headers => true, :header_converters => :symbol, :converters => :all) do |row|
      people << Hash[row.headers[0..-1].zip(row.fields[0..-1])]
    end
    people
    # file = CSV.read(@file, :quote_char => "|", :col_sep=>',')
    # keys, values = file.first, file[1..-1]
    # keys = keys.map {|i| i.to_sym}
    # people = values.map {|data| keys.zip(data)}.map(&:to_h)
    # pp keys
    # @people.map {|data| data[:timestamp] = DateTime.parse(data[:timestamp])}
    # @people.map! {|data| [Person.new(data)]}
    # @people
  end
end


# frank driver code
test = PersonParser.new('people_fake_data.csv')
test.people

# dom driver code

# people = {}
# # DRIVER
#     CSV.foreach("people_fake_data.csv", :headers => true, :header_converters => :symbol, :converters => :all) do |row|
#       people[row.fields[0]] = Hash[row.headers[0..-1].zip(row.fields[0..-1])]
#     end


# pp people
