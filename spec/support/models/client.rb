# frozen_string_literal: true

class Client
  def initialize(existing_ids)
    @existing_ids = existing_ids
  end

  def request(id)
    requested << id

    return unless existing_ids.include?(id)
    { id: id }
  end

  def requested
    @requested ||= []
  end

  private

  attr_reader :existing_ids
end
