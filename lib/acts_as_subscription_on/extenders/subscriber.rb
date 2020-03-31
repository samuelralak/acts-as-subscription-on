# frozen_string_literal: true

module ActsAsSubscriptionOn
  module Extenders
    module Subscriber
      def subscriber?
        false
      end

      def acts_as_subscriber(args = {})
        require "acts_as_subscription_on/subscriber"
        include ActsAsSubscriptionOn::Subscriber

        class_eval do
          def self.subscriber?
            true
          end
        end
      end
    end
  end
end
