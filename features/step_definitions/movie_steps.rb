# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create(movie)
  end
  #pending "Fill in this step in movie_steps.rb"
end

Then /(.*) seed movies should exist/ do | n_seeds |
  expect(Movie.count).to eq n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  #pending "Fill in this step in movie_steps.rb"

  begin
    DateTime.parse e1
    DateTime.parse e2

    within(:xpath, %(//table[@id="movies"]/tbody)) do
      release_dates = page.all(:xpath, "//td[3]").to_a.map do 
        |el| DateTime.parse(el.text)
      end.compact
      
      expect(release_dates.index(e1) < release_dates.index(e2)).to be true
    end
  rescue ArgumentError
    expect(page.body.index(e1) < page.body.index(e2)).to be true
  end
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /^I press "(.*)" button/ do |button|
  click_button button
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  #pending "Fill in this step in movie_steps.rb"
  ratings = rating_list.split(', ')
  ratings.each do |rating|
    #puts "rating"
    #puts rating
    uncheck ? uncheck("ratings[#{rating}]") : (check("ratings[#{rating}]"))
  end
end

# Part 2, Step 3
Then /^I should (not )?see the following movies: (.*)$/ do |present, movies_list|
  # Take a look at web_steps.rb Then /^(?:|I )should see "([^"]*)"$/
  #pending "Fill in this step in movie_steps.rb"
  movies = movies_list.split(', ')
  movies.each do |movie|
    if present.nil?
      expect(page).to have_content(movie)
    else
      expect(page).not_to have_content(movie)
    end
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  #pending "Fill in this step in movie_steps.rb"
  expect(page).to have_xpath(".//tr[not(ancestor::thead)]", :count => Movie.count)
end

### Utility Steps Just for this assignment.

Then /^debug$/ do
  # Use this to write "Then debug" in your scenario to open a console.
   require "byebug"; byebug
  1 # intentionally force debugger context in this method
end

Then /^debug javascript$/ do
  # Use this to write "Then debug" in your scenario to open a JS console
  page.driver.debugger
  1
end


Then /complete the rest of of this scenario/ do
  # This shows you what a basic cucumber scenario looks like.
  # You should leave this block inside movie_steps, but replace
  # the line in your scenarios with the appropriate steps.
  fail "Remove this step from your .feature files"
end
