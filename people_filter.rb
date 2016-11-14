module PeopleFilter

  def is_mentor?
    self.would_like_to_be_a == "mentor" || self.would_like_to_be_a == "both"
  end

  def is_mentee?
    self.would_like_to_be_a == "mentee" || self.would_like_to_be_a == "both"
  end

  def is_mentor_and_mentee?
    self.would_like_to_be_a == "both"
  end

  def available?
    self.format_times_available
    self.can_attend_mentoring_sessions.any? do |time|
      time == "Morning" || time == "Afternoon" || time == "Evening"
    end
  end

end

# Current return values

# Mentors:
# Jonah
# Jackson
# Jorden
# Kendall
# Blossom
# Hedda
# Emerald
# Joy

# Mentees:
# Amethyst
# Jonah
# Jackson
# Blossom
# Tyler
# Avram
# Emerald
# Xaviera
# Lani

# Not included:
# McKenzie - 3 (mentee), Lamar - 5 (mentee), Keegan - 6 (mentee), Marshall - 7 (mentor)