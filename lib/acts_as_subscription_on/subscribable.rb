# frozen_string_literal: true

module ActsAsSubscriptionOn
  module Subscribable
    def self.included(base)
      base.class_eval do
        has_many :subscription_topics, class_name: "ActsAsSubscriptionOn::Subscription", as: :topic, dependent: :destroy
      end
    end

    def subscribed_to(subscriber, activity, action = nil)
      ActsAsSubscriptionOn::Subscription.where(
        topic: self,
        is_topic_owner: (self.class.name == activity.class.name),
        subscriber: subscriber,
        activity: activity,
        action: action,
      ).first_or_create!
    end
  end
end
