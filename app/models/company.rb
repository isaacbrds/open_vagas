class Company < ApplicationRecord
  belongs_to :user
  validates :name, :url, presence: true
  has_one_attached :logo
end
