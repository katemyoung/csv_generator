require 'capybara'
require 'capybara/dsl'
require 'capybara/cuprite'

Capybara.configure do |c| 
  c.run_server = false
  c.default_driver = :cuprite
  c.app_host = 'http://www.google.com'
end

Capybara.register_driver(:cuprite) do |app|
  Capybara::Cuprite::Driver.new(app, window_size: [1200, 800])
end

class EnapsaSubmission
  include Capybara::DSL
  def runner
    visit '/'
    click_on "Reject all"
    binding.pry
    fill_in "Search", with: "thoughtbot"
    click_on "Google Search" 
    
  end
end
