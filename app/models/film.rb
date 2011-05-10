class Film < ActiveRecord::Base
  attr_accessible :name, :url, :description
  validates_presence_of :name, :url, :description
  before_validation :clean_url
  
  private
  def clean_url
    self.url.gsub!("http://","") if self.url
  end
  
end
