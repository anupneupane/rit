require 'spec_helper'

describe User do
  before do
    @valid_attributes = {
      :email => 'tester@test.com', 
      :username => 'Tester Khan', 
      :password => 'password'
    }
  end
  context "Relationships" do
    it { should have_many(:registrations) }
    it { should have_many(:courses).through(:registrations) }
  end
  
  context "Registration" do
    it "should allow users to register for a course" do  
      @user = User.make(@valid_attributes)
      # @course = Course.make
      #     lambda   {@user.register_for(@course)}.should change(@users, :courses).from([]).to([@course])
    end
  end
end

