class Colony < ApplicationRecord
    has_many :cats
    validates :code, uniqueness: true
end
