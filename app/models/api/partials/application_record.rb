module Api
  module Partials
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
