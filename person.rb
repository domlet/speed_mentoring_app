require_relative 'people_filter'
require_relative 'person_helper'

class Person

  include PeopleFilter
  include PersonHelper

  attr_reader :timestamp, :first_name, :last_name, :company_university_or_looking, :job_title, :city, :email, :linkedin_profile, :twitter, :facebook, :website_or_portfolio, :would_like_to_be_a, :is_interested_in_learning, :has_skills, :can_attend_mentoring_sessions, :identifies_as, :share_my_information_with
  attr_accessor :matches

  def initialize(args = {})
    @timestamp = args[:timestamp]
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @company_university_or_looking = args[:company_university_or_looking]
    @job_title = args[:job_title]
    @city = args[:city]
    @email = args[:email]
    @linkedin_profile = args[:linkedin_profile]
    @twitter = args[:twitter]
    @facebook = args[:facebook]
    @website_or_portfolio = args[:website_or_portfolio]
    @would_like_to_be_a = args[:would_like_to_be_a]
    @is_interested_in_learning = args[:is_interested_in_learning]
    @has_skills = args[:has_skills]
    @can_attend_mentoring_sessions = args[:can_attend_mentoring_sessions]
    @identifies_as = args[:identifies_as]
    @share_my_information_wit = args[:share_my_information_with]
    @matches = []
  end

end

