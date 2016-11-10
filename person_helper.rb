module PersonHelper

  def times_available
    self.can_attend_mentoring_sessions ? self.can_attend_mentoring_sessions.split : []
  end
end