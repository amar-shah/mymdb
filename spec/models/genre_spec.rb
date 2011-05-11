require File.dirname(__FILE__) + '/../spec_helper'

describe Genre do
  it "should be valid" do
    Genre.new.should be_valid
  end
end
