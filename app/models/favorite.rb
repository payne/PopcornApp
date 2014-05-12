class Favorite < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validate_uniqueness_of :user_id, :scope => :movie_id
end
