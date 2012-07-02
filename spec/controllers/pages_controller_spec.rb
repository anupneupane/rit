require 'spec_helper'

describe PagesController do
  [:home, :explore, :about, :community].each  do |action|
    context action do
      before(:each) { get action }
      it("renders #{action}") { response.should render_template action }
    end
  end

end
