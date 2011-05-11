class Comment < ActiveRecord::Base
  belongs_to :film, :user
  validates_presence_of :user, :film, :text
end
