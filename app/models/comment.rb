class Comment < ApplicationRecord
     belongs_to :user
     has_many :likes, :as => :imageable
     has_many :comments, :as => :commented
     belongs_to :commented, :polymorphic => true

end
