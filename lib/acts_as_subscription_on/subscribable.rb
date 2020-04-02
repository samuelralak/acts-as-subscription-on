# frozen_string_literal: true

module ActsAsSubscriptionOn
  module Subscribable
    def self.included(base)
      base.class_eval do
        has_many :subscription_topics, class_name: "ActsAsSubscriptionOn::Subscription", as: :topic, dependent: :destroy
      end
    end

    def get_subscribers()
      subscription_topics.where(topic_id: self.id).map(&:subscriber)
    end
  end
end
