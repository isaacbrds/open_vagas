class Position < ApplicationRecord
  belongs_to :company
  validates :name, :summary, :description, presence: true
  enum career: { developer: 0, business_inteligence: 1,
                information_technology: 2, designer: 3 }
  enum contract: { clt: 0, pj: 1, both: 2 }
end
