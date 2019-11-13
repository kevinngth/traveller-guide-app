class Experience < ApplicationRecord
  belongs_to :category
  belongs_to :guide
end