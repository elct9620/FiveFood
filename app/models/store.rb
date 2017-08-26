# frozen_string_literal: true

# :nodoc:
class Store < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :update_geocode?

  acts_as_taggable

  before_save -> { self.tag_list = tag_list & Settings.tags }

  validates :name, :description, :address, presence: true

  default_scope -> { order(created_at: :desc) }

  private

  def update_geocode?
    address.present? && address_changed?
  end
end
