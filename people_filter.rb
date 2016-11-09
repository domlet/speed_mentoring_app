module PeopleFilter

  def is_mentor?
    self.would_like_to_be_a == "mentor"
  end

  def is_mentee?
    self.would_like_to_be_a == "mentee"
  end

  def is_both?
    self.would_like_to_be_a == "both"
  end

end