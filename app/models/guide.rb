class Guide < ApplicationRecord
    has_many :experiences, dependent: :destroy

    belongs_to :user


    has_many :review

end