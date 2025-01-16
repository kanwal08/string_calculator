require_relative 'string_calculator'

def assert_equal(expected, actual)
  if expected == actual
    puts "Test Pass: #{expected} = #{actual}"
  else
    puts "Test Fail: #{expected} != #{actual}"
  end
end

assert_equal(0, StringCalculator.add(""))
assert_equal(1, StringCalculator.add("1"))
assert_equal(3, StringCalculator.add("1, 2"))