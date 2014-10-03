Given(/^i have arrived at the "(.*?)" page$/) do |page|
  visit "/#{page}"
end

When(/^i enter my "(.*?)" in the empy "(.*?)"$/) do |name, player|
  fill_in 'player', :with => name
  click_button 'Start A Game'
end

Then(/^I see the question "(.*?)"$/) do |text|
  expect(page).to have_content text
end