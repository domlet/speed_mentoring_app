require 'pp'
require_relative 'person_parser'

class Matcher

  attr_accessor :people

  def initialize(people)
    @people = people.select {|person| person.available?}
  end

  def mentors
    @people.select {|person| person.is_mentor?}
  end

  def mentees
    @people.select {|person| person.is_mentee?}
  end

  def pair_mentors_with_mentees
    mentors.each {|mentor| mentor.matches = mentees}
  end

  def pair_mentees_with_mentors
    mentees.each {|mentee| mentee.matches = mentors}
  end

  def match_times_available
    people.each do |person|
       pp person.can_attend_mentoring_sessions
    end
  end

end

# Driver Code
test_people = PersonParser.new('people_fake_data.csv')
matcher = Matcher.new(test_people.people_objects)
matcher.pair_mentors_with_mentees
matcher.pair_mentees_with_mentors
matcher.match_times_available

# pp matcher.people[0].times_available

# Test return value for pairing methods
# puts matcher.mentees[0].matches
# puts "*" * 20
# puts matcher.mentors[0].matches


