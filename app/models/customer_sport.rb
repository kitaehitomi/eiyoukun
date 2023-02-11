class CustomerSport < ApplicationRecord
  belongs_to :customer
  belongs_to :sport
end
