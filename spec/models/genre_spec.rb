require File.dirname(__FILE__) + '/../spec_helper'

describe Genre do
  it "should be valid" do
    Genre.new.should be_valid
  end
  
  it 'should destroy all films that belong to this genre' do
    genre = Genre.create!(:name=>"horror")
    genre.films.create!(:name=>'text',:url=>"http//url",:rating=>2,:description=>'text')
    lambda do
      genre.destroy
    end.should change(Film,:count).by(-1)
  end
  
end
