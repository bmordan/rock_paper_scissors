Given(/^I have a friend wanting to play with me$/) do
  visit '/'
  fill_in 'player', with: "bobster"
  click_on 'Start A Game'
end

When(/^I have entered my "(.*?)" I click on "(.*?)"$/) do |name, link|
  click_link link
end

Then(/^I see the message "(.*?)"$/) do |message|
  expect(page).to have_content message
end

Given(/^my friends are not around$/) do
   visit '/'
  fill_in 'player', with: "bobster"
  click_on 'Start A Game' 
end

When(/^I have entered my name I click on "(.*?)"$/) do |link|
  click_link link
end

Then(/^I see the message OK "(.*?)" you are playing Robot$/) do |arg1|
  expect(page).to have_content('OK bobster you are playing Robot')
end