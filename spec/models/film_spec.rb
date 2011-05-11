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
  
  describe 'ratings' do
    
    it 'should be valid when rating is zero to five' do
      (0..5).each do |rating|
        film = Factory.build(:film,:rating=>rating)
        film.valid?.should be_true
      end
    end
    
    it 'should not be valid when rating is minus one' do
      film = Factory.build(:film,:rating=>-1)
      film.valid?.should be_false
      film.errors_on(:rating).should == ["must be greater than -1"] 
    end
    
    it 'should not be valid when rating is six' do
      film = Factory.build(:film,:rating=>6)
      film.valid?.should be_false
      film.errors_on(:rating).should == ["must be less than 6"] 
    end
  
  end
  
end

# == Schema Information
#
# Table name: films
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  url         :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  rating      :integer
#

