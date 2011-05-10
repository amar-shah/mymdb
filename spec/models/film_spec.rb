require File.dirname(__FILE__) + '/../spec_helper'

describe Film do
  
  it "should be valid with a name url and descrption" do
    film=Factory(:film,:name=>"Film name",:url=>"Film URL",:description=>"Film descrption")
    film.should be_valid
  end
  
  describe 'cleaning the url' do
    it "should clean the leading http when saved" do
      film=Factory(:film,:url=>"http://someurl")
      film.save!
      film.url.should == "someurl"
    end
    
    it "should not clean url when there is not http://" do
      film=Factory(:film,:url=>"someurl")
      film.save!
      film.url.should == "someurl"
    end
    
    it "should do nothing when no url provided" do
      film=Factory.build(:film,:url=>nil)
      film.valid?
      film.url.should be_nil
    end
  end
  
end
