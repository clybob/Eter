require 'simplecov'
SimpleCov.start

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def assert_index_tags( tr_count, td_count )
    assert_tag :tag => 'table', :attributes => {:class=>'table table-striped'},
               :child => {:tag => 'tbody',
               :children => {:count => tr_count, :only=>{:tag=>'tr'}},
                 :child => {:tag => 'tr',
                   :children => {:count => td_count, :only=>{:tag=>'td'}}
                 }
               }
  end

  def assert_paginate_is_displayed
    assert_tag :tag => 'div', :attributes => {:class => 'pagination'}
  end
end

