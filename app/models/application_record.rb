class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include Concerns::Confirmations
end
