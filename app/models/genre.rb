class Genre < ActiveRecord::Base
  has_many :films, :dependent => :destroy
end
