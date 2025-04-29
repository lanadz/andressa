# frozen_string_literal: true

require "minitest/autorun"
require "mocha/minitest"
require "debug"
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new(color: true)

module Minitest
  class Test
    def self.test(message, &block)
      method_name = "test_#{message.gsub(/\s+/, '_').gsub(/\W/, '')}"
      raise ArgumentError, "Test #{method_name} already defined" if method_defined?(method_name)
      define_method(method_name, &block) if block_given?
    end
  end
end
