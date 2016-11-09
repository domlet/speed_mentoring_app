require 'pp'
require_relative 'person_parser'

class Matcher

  def initialize(people)
    @people = people
  end

  def mentors
    @people.select {|person| person.is_mentor?}
  end

  def mentees
    @people.select {|person| person.is_mentee?}
  end

end

test = PersonParser.new('people_fake_data.csv')
matcher = Matcher.new(test.people_objects)
pp matcher.mentees