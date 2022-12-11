class Movie < ApplicationRecord
  belongs_to :director

  validates :title, :year, presence: true
end
