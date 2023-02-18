class Food < ApplicationRecord
  has_many :customer_foods, dependent: :destroy
end
