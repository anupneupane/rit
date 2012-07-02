require 'spec_helper'

describe CoursesController do
  before do
    @valid_attributes = {
    :name => 'Test Course', 
    :price => 100
    }
  end

  context "Index" do
      let(:courses) { [Course.make] }

    before(:each) do
      get :index
    end

      it("renders") { response.should render_template 'index' }
  end
  action_templates = {
  'show' => 'show',
  'edit' => 'edit',
  'new'  => 'new'
  }
  action_templates.each do |action, template|
    context action do
      let(:course) { Course.make!(@valid_attributes) }
      before(:each)  { get action, 'id' => course.id }
      it "renders #{template}" do
        response.should render_template template 
      end
    end
  end
    context "Record Not Found For Edit" do
      it "should raise record not found error when invalid id passed" do
         assert_raises (ActiveRecord::RecordNotFound) do
          get :edit, 'id' => Course.all.map(&:id).max + 1 
         end
      end
    end

    context "Create a New Course" do
      it "should add a course to the database" do
        lambda { post 'create', :course => @valid_attributes }.should change(Course, :count).by(1)
      end
      let(:course) { Course.new({}) }
      before { post 'create', :course => course }
      it("should raise an error") { course.errors.should_not be_nil }
    end

    context "Delete a Course" do
      let(:course) { Course.make!(@valid_attributes) }
      before  { delete 'destroy', 'id' => course.id }
      it "should remove the course from the database" do
        assert_raises (ActiveRecord::RecordNotFound) do
          Course.find(course.id)
        end
      end
    end

    context "Update a Course" do
      let(:course) { Course.make!(@valid_attributes) }
      it "should modify the record accordingly" do
        debugger
         post 'update',{"course"=>{"name"=>"Updated Course", "price"=>"10000"}, "commit"=>"Update Course", "id"=>course.id}.should_not == course
      end
    end
end
