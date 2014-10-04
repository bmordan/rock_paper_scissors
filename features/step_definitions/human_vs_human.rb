Given(/^I have decided on a gesture$/) do
  visit '/play/human'
end

When(/^I click on "(.*?)"$/) do |gesture|
  click_link 'spock'
end

Then(/^I goto the results page and see the result$/) do
  expect(page).to have_xpath('.//div[contains(@class,"winner")]')
end