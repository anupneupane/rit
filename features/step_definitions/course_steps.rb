Given /^a course that is "(.*?)"$/ do |course|
  @course = Course.make(:name => course)
end

When /^I go to the course homepage$/ do
  visit("/courses/#{@course.id}")
end

Then /^I should see the "(.*?)" button$/ do |button|
  has_button?(button)
end

When /^I click on "(.*?)"$/ do |button|
  click_on(button)
end

Then /^I should see the "(.*?)" page for the course$/ do |page_name|
  request.request_uri.should == send("#{page_name.downcase.gsub(' ', '_')}_path")
  response.should be_success
end

