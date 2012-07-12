require 'spec_helper'

describe ApplicationController do
  context "Application Helper" do
      it "should"  do
      lambda {helper.ilink_to('icon', 'icon', 'icon')}.should_not be_nil
      end
    end
  # 
  #   context " Forem User" do
  #    controller do
  #      def index
  #        redirect_to courses_path
  #        forem_user
  #      end
  #    end
  # 
  #     before { @current_user = current_user = User.make! } 
  #     it "should return the current user" do
  #       get :index
  #       response.should == @current_user
  #     end
  #   end

end
