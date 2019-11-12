class Guide < ApplicationRecord
    has_many :experiences, dependent: :destroy
    has_and_belongs_to_many :users
end