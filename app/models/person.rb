class Person < ApplicationRecord
  has_one :address
  belongs_to :organization
end
