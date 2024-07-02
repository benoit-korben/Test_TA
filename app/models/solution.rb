class Solution < ApplicationRecord
  # belongs_to :parties

  validates :word, presence: true
end
