class Event < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
end
