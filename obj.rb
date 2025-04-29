class Obj
  def public_method_to_test(array_of_params)
    response = method_that_should_return_predictable_response(array_of_params)
    result = method_you_added(response)
    method_that_shouldnt_be_called_when_bad_response if result

    result
  end

  private

  def method_that_should_return_predictable_response(array_of_params)
    puts("this text will disapper when stubbed: #{array_of_params}")

    response = {}
    array_of_params.each do |param|
      currency = param.odd? ? "CAD" : "USD"
      response[param] = currency
    end

    response
  end

  def method_you_added(response)
    puts("method_you_added with: #{response}")

    response = if response.values.uniq.size == 1
      # no-op
      # "good, no logs"
      true
    else
      puts "Log a problem for response #{response.keys}"
      false
    end

    response
  end

  def method_that_shouldnt_be_called_when_bad_response
    puts "WOO!"
  end
end
