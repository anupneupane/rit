
require 'spec_helper'
describe Course do
  
  before do
    @valid_attributes = {
      :name => "Course1", 
      :price => 549
    }
    @required_attributes = [:name, :price]
  end
  context "Relationships" do
    it { should have_many (:registrations) }
    it { should have_many(:users).through(:registrations) }
    it { should have_many (:lessons) }
  end
  
  context "Validations" do
   
    it "should save correctly" do
     lambda { Course.create(@valid_attributes)}.should change(Course, :count).by(1)
    end 
   
      it "should validate presence of required attributes" do
        @required_attributes.each do |attribute|
          Course.new(@valid_attributes.except(attribute)).should_not be_valid
        end
    end
  end
  context "Google Shopping Cart" do
    it "should correctly create a product hash for the Google Shopping Cart" do
    expected_hash = {
      :name => "Course1", 
      :description => "Course1",
      :price => 549,
      :quantity => 1,
      :currency => 'USD',
      :regular_shipping => 0
    }
    (Course.make(@valid_attributes).to_google_product).should == expected_hash
    end
  end
end


