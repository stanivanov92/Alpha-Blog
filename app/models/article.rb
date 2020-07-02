# frozen_string_literal: true

# Class Article
class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 25 }
  validates :description, presence: true, length: { minimum: 5, maximum: 305 }

  belongs_to :user, inverse_of: :articles
end
