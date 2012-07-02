require 'spec_helper'

describe ApplicationController do
  context "Application Helper" do
    it "should"  do
      ApplicationHelper.ilink_to('icon', 'hello', courses_path).should == '' 
    end
  end

end
