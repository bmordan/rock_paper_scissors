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

Given(/^I am playing a robot$/) do
  visit '/'
  fill_in 'player', with: "Amy"
  click_on 'Start A Game'
end

When(/^I choose an option$/) do
  click_link 'robot'
  click_link 'paper'
end

Then(/^I see the results page$/) do
  expect(page).to have_css('i.fa')
end

Given(/^I have finished playing$/) do
  visit '/'
  fill_in 'player', with: "Amy"
  click_on 'Start A Game'
  click_link 'robot'
  click_link 'paper'   
end

When(/^I choose to leave the game$/) do
  click_link 'exit'
end

Then(/^I get to start again$/) do
  expect(page).to  have_css('form')
end

Given(/^I want to play again$/) do
  visit '/'
  fill_in 'player', with: "Amy"
  click_on 'Start A Game'
  click_link 'robot'
  click_link 'paper'   
end

When(/^I reset$/) do
  click_link 'reset'
end

Then(/^I get to play again$/) do
  expect(page).to have_content('OK')
end