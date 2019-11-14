class Review < ApplicationRecord

    belongs_to :user , required: false
    belongs_to :guide, required: false
end
