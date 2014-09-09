Given(/^I visit the front page$/) do
  visit "/"
end

Then(/^I see a text that reads "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end
