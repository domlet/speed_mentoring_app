require 'csv'
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
    @people.flatten
  end

  private
  def parse_people_objects_from_file
    file = CSV.read(@file, :quote_char => "|", :col_sep=>',')
    keys, values = file.first, file[1..-1]
    puts keys
    # new_keys = keys.map {|i| i.to_sym}
    # puts new_keys
    # @people = values.map {|data| new_keys.zip(data)}.map(&:to_h)
    # @people.map {|data| data[:timestamp] = DateTime.parse(data[:timestamp])}
    # @people.map! {|data| [Person.new(data)]}
    # @people
  end
end


# driver code
test = PersonParser.new('people.csv')
p test.people[0]