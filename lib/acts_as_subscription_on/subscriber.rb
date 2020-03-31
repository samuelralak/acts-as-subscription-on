# frozen_string_literal: true

module ActsAsSubscriptionOn
  module Subscriber
    def self.included(base)
      base.class_eval do
        has_many :subscriptions, class_name: "ActsAsSubscriptionOn::Subscription", as: :subscriber, dependent: :destroy
      end
    end

    def subscribe_to(topic, activity, action = nil)
      ActsAsSubscriptionOn::Subscription.where(
        topic: topic,
        is_topic_owner: (topic.class.name == activity.class.name),
        subscriber: self,
        activity: activity,
        action: action,
      ).first_or_create!
    end
  end
end
