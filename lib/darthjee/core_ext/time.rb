# frozen_string_literal: true

# Add transforming methods to Time
class Time
  delegate :days_between, to: :to_date
end
