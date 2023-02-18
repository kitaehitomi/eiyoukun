class Sport < ApplicationRecord
  has_many :customer_sports, dependent: :destroy
end
