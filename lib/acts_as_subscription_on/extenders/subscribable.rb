# frozen_string_literal: true

module ActsAsSubscriptionOn
  module Extenders
    module Subscribable
      def subscribable?
        false
      end

      def acts_as_subscribable(args = {})
        require "acts_as_subscription_on/subscribable"
        include ActsAsSubscriptionOn::Subscribable

        class_eval do
          def self.subscribable?
            true
          end
        end
      end
    end
  end
end
