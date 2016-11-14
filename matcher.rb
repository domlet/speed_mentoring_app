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

  # fix method so that it assigns value to matches (should be an Array)
  # Not returning the right size of mentors or matches
  def pair_mentors_with_mentees
    mentors.each do |mentor|
      mentor.matches = mentees
      mentor.matches.delete(mentor) if mentor.matches.include?(mentor)
    end
  end

  def pair_mentees_with_mentors
    mentees.each do |mentee|
      mentee.matches = mentors
      mentee.matches.delete(mentee) if mentee.matches.include?(mentee)
    end
  end

  def match_times_available
    people.each do |person|
      person.matches = person.matches.select do |match|
        match.can_attend_mentoring_sessions.any? {|time| person.can_attend_mentoring_sessions.include?(time) }
      end
    end
  end

end

# Driver Code
test_people = PersonParser.new('people_fake_data.csv')
people = test_people.people_objects
matcher = Matcher.new(people)
# puts matcher.people
matcher.pair_mentors_with_mentees
matcher.pair_mentees_with_mentors
# matcher.match_times_available

# Only some people get matched and other do not

# puts matcher.people[0].first_name
# puts matcher.people[0].matche

# Test return value for pairing methods
puts "#{matcher.people.length} people are available out of #{people.length}"
# should be 12 mentees and 13 mentors
# around seven people put both
puts "Out of #{matcher.mentees.length} total mentees, these match for #{matcher.mentors[2].first_name}\n\n"

matcher.mentors[2].matches.each do |match|
  puts match.first_name
end
puts "*" * 22

puts "Out of #{matcher.mentors.length} total mentors, these match for #{matcher.mentees[2].first_name}\n\n"

matcher.mentees[2].matches.each do |match|
  puts match.first_name
end


