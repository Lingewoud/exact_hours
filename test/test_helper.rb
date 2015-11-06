require 'simplecov'
require 'thor'

SimpleCov.start do
  add_filter '/test/'
  add_filter '/vendor/'
end
require 'exact_hours/commands'
require 'exact_hours/version'

require 'minitest'
require 'minitest/unit'
require 'minitest/autorun'
require 'minitest/pride'

#require "codeclimate-test-reporter"
#CodeClimate::TestReporter.start



