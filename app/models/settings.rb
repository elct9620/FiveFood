# frozen_string_literal: true

# :nodoc:
class Settings < Settingslogic
  source Rails.root.join('config', 'settings.yml')
  namespace Rails.env
end
