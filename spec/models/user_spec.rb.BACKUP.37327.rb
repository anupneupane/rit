require 'spec_helper'

describe User do
  before do
    @valid_attributes = {
      :email => 'test0@rit.com', 
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
  context "Authentication" do
<<<<<<< HEAD
    it "should be able to login eithe their username or password" do
      @user = User.create!(@valid_attributes)
      conditions_by_username = {"username" => "Tester Khan"}
      conditions_by_email = {"email"=>"test0@rit.com"}
      conditions_by_login = {:login => "Tester Khan"}
      conditions_by_login_email = {:login => 'test0@rit.com'}
      User.find_first_by_auth_conditions(conditions_by_email).should == @user
      User.find_first_by_auth_conditions(conditions_by_login).should == @user
      User.find_first_by_auth_conditions(conditions_by_login_email).should == @user
      User.find_first_by_auth_conditions(conditions_by_username).should == @user
    end
=======
    it "should find users by their emails or their usernames" do
      email_warden_conditions = {"login"=>"test0@rit.com"}
      username_warden_conditions = {"login" => "Tester Khan"}
      u = User.make(@valid_attributes)
      User.find_first_by_auth_conditions(email_warden_conditions).should == u 
      User.find_first_by_auth_conditions(username_warden_conditions).should == u 

    end

>>>>>>> f18f2e7f6a3393e5c395553fd9e48d16ecf6e3ed
  end
end

