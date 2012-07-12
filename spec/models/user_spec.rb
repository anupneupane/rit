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
  end
  
  context " Roles" do
    it "should return the correct Role" do
      @role = Role.make!
      @user = User.make.with_role(@role)
      @user.roles.should == [@role]
    end
    
    it "should return false when checking for a given role that does not exist" do
      @user = User.make(@valid_attributes)
      @role = Role.make!
      @user.role?(@role).should be_false
    end
    
    it "should return true when checking for a given role that exists" do
      @role = Role.make!
      @user = User.make.with_role(@role)
      puts @user.roles
      @user.role?(@role).should be_true
    end
  end
end

