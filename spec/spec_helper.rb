require 'simplecov'
SimpleCov.start

require 'webmock/rspec'
require 'support/fake_website'
require_relative '../crawler/crawler'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:each) do
    stub_request(:any, Regexp.new('http://website.com')).to_rack(FakeWebSite)
  end
end
