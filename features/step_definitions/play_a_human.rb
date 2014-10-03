Given(/^I have decided to play a human$/) do
  visit '/'
  fill_in 'player', :with => "Human"
  click_button 'Start A Game'
end

When(/^I click on "(.*?)"$/) do |arg1|
  click_link 'Human'
end

Then(/^I can pick an item$/) do
  expect(page).to have_content('Choose')
end