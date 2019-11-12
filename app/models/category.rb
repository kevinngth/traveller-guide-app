class Category < ApplicationRecord
  has_many :experiences, dependent: :destroy
end