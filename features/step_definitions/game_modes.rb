Given(/^I have a friend wanting to play with me$/) do
  visit '/'
  fill_in 'player', with: "bobster"
  click_on 'Start A Game'
end

When(/^I have entered my name I click on friends$/) do
  click_link 'human'
end

Then(/^I see the message "(.*?)"$/) do |message|
  expect(page).to have_content message
end

Given(/^my friends are not around$/) do
  visit '/'
  fill_in 'player', with: "Amy"
  click_on 'Start A Game' 
end

When(/^I have entered my name "(.*?)" I click on robot$/) do |player|
  click_link 'robot'
end

Then(/^I see the message OK you are playing a Robot$/) do
  expect(page).to have_content('OK #{player} you are playing Robot')
end