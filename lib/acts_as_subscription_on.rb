# frozen_string_literal: true

require "acts_as_subscription_on/version"

$LOAD_PATH.unshift(File.dirname(__FILE__))

module ActsAsSubscriptionOn
  class Error < StandardError; end

  if defined?(ActiveRecord::Base)
    require "acts_as_subscription_on/extenders/subscribable"
    require "acts_as_subscription_on/extenders/subscriber"
    require "acts_as_subscription_on/subscription"
    ActiveRecord::Base.extend ActsAsSubscriptionOn::Extenders::Subscribable
    ActiveRecord::Base.extend ActsAsSubscriptionOn::Extenders::Subscriber
  end
end
