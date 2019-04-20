# frozen_string_literal: true

# @api public
module Math
  # Calculates avarage from a series of values
  #
  # @param values [::Array] list of values
  #
  # @return [::Float]
  def self.average(values)
    values = values.map { |v| [v, 1] }.to_h unless values.is_a?(Hash)

    values.inject(0) do |sum, vals|
      sum + vals.inject { |a, b| a * b }
    end / values.values.sum.to_f
  end
end
