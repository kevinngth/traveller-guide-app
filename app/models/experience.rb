class Experience < ApplicationRecord
  belongs_to :categories
  belongs_to :guides
end