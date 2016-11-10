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
    self.times_available.any? do |time|
      time == "Morning" || time == "Afternoon" || time = "Evening"
    end
  end

end