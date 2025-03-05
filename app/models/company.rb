class Company < ApplicationRecord
  belongs_to :user
  has_many :positions
  validates :name, :url, presence: true
  has_one_attached :logo
end
