Given(/^I have a friend wanting to play with me$/) do
  visit '/'
  fill_in 'player', with: "bobster"
  click_on 'Start A Game'
end

When(/^I have entered my name I click on "(.*?)"$/) do |link|
  click_link link
end

Then(/^I see the message "(.*?)"$/) do |message|
  expect(page).to have_content message
end