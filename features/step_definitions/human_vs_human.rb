Given(/^I have decided on a gesture$/) do
  visit '/'
  fill_in('player', with: "Johno")
  click_on 'Start A Game'
end

When(/^I click on "(.*?)"$/) do |gesture|
  click_link 'Spock'
end

Then(/^I goto the results page and see the result$/) do
  expect(page).to have_xpath('.//div[contains(@class,"winner")]')
end