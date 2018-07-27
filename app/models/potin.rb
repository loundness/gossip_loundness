class Potin < ApplicationRecord
    belongs_to :user
    has_many :likes, :as => :imageable
    has_many :comments, :as => :commented
end
