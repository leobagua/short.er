module Concerns
  module Confirmations
    extend ActiveSupport::Concern

    included do
      def has_saved?
        valid? && persisted?
      end

      def has_updated?
        valid?
      end
    end
  end
end
