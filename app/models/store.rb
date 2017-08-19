# frozen_string_literal: true

# :nodoc:
class Store < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :update_geocode?

  default_scope -> { order(created_at: :desc) }

  private

  def update_geocode?
    address.present? && address_changed?
  end
end
