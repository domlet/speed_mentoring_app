module PersonHelper

  def format_times_available
    if self.can_attend_mentoring_sessions == "Any session works for me"
      self.can_attend_mentoring_sessions = ["Morning", "Afternoon", "Evening"]
    elsif self.can_attend_mentoring_sessions.nil?
      self.can_attend_mentoring_sessions = []
    else
      self.can_attend_mentoring_sessions = self.can_attend_mentoring_sessions.split(/\s*,\s*/)
    end
  end

end