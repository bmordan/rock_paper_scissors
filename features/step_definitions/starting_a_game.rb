Given(/^I have arrived at the "(.*?)" page$/) do |page|
  visit "/"
end

When(/^I enter my "(.*?)" in the emtpy "(.*?)"$/) do |name, player|
  fill_in 'player', :with => name
  click_button 'Start A Game'
end

Then(/^I see the question "(.*?)"$/) do |text|
  expect(page).to have_content text
end

When(/^I do not enter a name in the field$/) do
  click_button 'Start A Game' 
end

Then(/^I see a prompt to "(.*?)"$/) do |prompt|
  expect(page).to have_content prompt
end

Given(/^I have entered a name$/) do
  visit '/' 
end

When(/^I arrive at the start page$/) do
  fill_in 'player', :with => "Derek"
  click_button 'Start A Game'
end

Then(/^I can choose to play alone or with friends$/) do
  expect(page).to have_content "alone"
end