class Article < ApplicationRecord

validates :title, presence: true, length: {minimum: 5, maximum: 25}
validates :description, presence: true, length: {minimum: 5, maximum: 105}

end