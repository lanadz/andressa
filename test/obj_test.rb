# frozen_string_literal: true

require_relative "test_helper"
require_relative '../obj'

class ObjTest < Minitest::Test
  extend Minitest::Spec::DSL

  # no stub tets
  test "#public_method_to_test returns true when it receives 0" do
    obj = Obj.new
    assert(obj.public_method_to_test([2,4]))
    puts "\n\n***"
  end

  test "#public_method_to_test returns true when it doesn't receive 0" do
    refute(Obj.new.public_method_to_test([1,2]))
    puts "\n\n***"
  end

  # stub tests

  test "#method_to_test returns false when method_that_should_return_predictable_response returns response with various currencies" do
    obj = Obj.new
    obj.expects(:method_that_should_return_predictable_response).returns(
      {1 => "CAD", 2 => "USD"}
    )
    refute(obj.public_method_to_test([0])) # bad, becous params here don't match params for method_that_should_return_predictable_response
    puts "\n\n***"
  end

  test "#method_to_test returns false when method_that_should_return_predictable_response returns response with various currencies + with" do
    obj = Obj.new
    obj.expects(:method_that_should_return_predictable_response).returns(
      {1 => "CAD", 2 => "USD"}
    )
    refute(obj.public_method_to_test([0])) # bad, becouse params here don't match params for method_that_should_return_predictable_response
    puts "\n\n***"
  end

  test "failing test #method_to_test returns false when method_to_stub doesn't return 1" do
    obj = Obj.new
    obj.expects(:method_that_should_return_predictable_response).with([1,2]).returns(
      {1 => "CAD", 2 => "USD"}
    )
    refute(obj.public_method_to_test([1, 2])) # better, with will catch incorrect params passed to method_that_should_return_predictable_response
    puts "\n\n***"
  end
end
