# frozen_string_literal: true

class Time
  delegate :days_between, to: :to_date
end
