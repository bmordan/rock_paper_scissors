Given(/^i have arrived at the "(.*?)" page$/) do |page|
  visit "/#{page}"
end

When(/^i enter my "(.*?)" in the empy "(.*?)"$/) do |name, player|
  fill_in 'player', :with => 'Simpson'
end

Then(/^I see the question "(.*?)"$/) do |text|
  expect('/start/:player').to have_content('Wait for another player?')
end