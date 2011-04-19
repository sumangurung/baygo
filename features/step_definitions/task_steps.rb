Given /^the following tasks:$/ do |tasks|
  Task.create!(tasks.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) task$/ do |pos|
  visit tasks_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following tasks:$/ do |expected_tasks_table|
  expected_tasks_table.diff!(tableish('table tr', 'td,th'))
end

Given /^I have tasks in different quadrants$/ do
  Factory(:task_in_quadrant_1)
  Factory(:task_in_quadrant_2)
  Factory(:task_in_quadrant_3)
  Factory(:task_in_quadrant_4)
end

When /^I visit the tasks page$/ do
  visit tasks_path
end

Then /^I should be able to see the tasks under their respective quadrants$/ do
  [ 
    [ Task.items_in_quadrant_1, '#quadrant_1' ],
    [ Task.items_in_quadrant_2, '#quadrant_2' ],
    [ Task.items_in_quadrant_3, '#quadrant_3' ],
    [ Task.items_in_quadrant_4, '#quadrant_4' ]
  ].each do |arr|
    assert_tasks_exist_in_quadrant(:tasks => arr.first, :element => arr.last)
  end

end

def assert_tasks_exist_in_quadrant(options)
  options ||= {}
  options[:tasks].map(&:title).each do |text|
    assert page.find(options[:element]).has_content?(text)
  end
end

