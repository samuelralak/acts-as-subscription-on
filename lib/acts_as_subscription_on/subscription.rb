# frozen_string_literal: true

module ActsAsSubscriptionOn
  class Subscription < ::ActiveRecord::Base
    if defined?(ProtectedAttributes)
      attr_accessible :topic_id,
                      :topic_type,
                      :subscriber_id,
                      :subscriber_type,
                      :activity_id,
                      :activity_type,
                      :action,
                      :is_topic_owner
    end

    belongs_to :topic, polymorphic: true
    belongs_to :subscriber, polymorphic: true
    belongs_to :activity, polymorphic: true

    validates_presence_of :topic_id
    validates_presence_of :topic_type
    validates_presence_of :subscriber_id
    validates_presence_of :subscriber_type
  end
end
