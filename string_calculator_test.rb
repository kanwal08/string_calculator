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
assert_equal(174, StringCalculator.add("3,4,5,7,10,20,25,100"))
# Test Case for New line between numbers
assert_equal(6, StringCalculator.add("1\n2,3"))
assert_equal(32, StringCalculator.add("1\n2,3, 4\n5,6,7\n4"))
assert_equal(15, StringCalculator.add("1\n2\n3\n4\n5"))
assert_equal(15, StringCalculator.add("1,2\n3,4\n5"))
assert_equal(210, StringCalculator.add("10,20\n30,40\n50,60"))
# Test Case for delimeters"
assert_equal(3, StringCalculator.add("//;\n 1; 2"))
assert_equal(31, StringCalculator.add("//;\n1; 2;6;10;12"))
assert_equal(10, StringCalculator.add("//|\n1| 2|3|4"))
assert_equal(6, StringCalculator.add("//-\n1-2-3"))
assert_equal(21, StringCalculator.add("//#\n1#2#3#4#5#6"))

def assert_exception(expected_message)
  begin
    yield
  rescue => e
    if e.message == expected_message
      puts "Test Pass: Exception '#{expected_message}'"
    else
      puts "Test Fail: Expected '#{expected_message}', got '#{e.message}'"
    end
  else
    puts "Test Fail: No exception raised, expected '#{expected_message}'"
  end
end

# Test Case for negative numbers
assert_exception("negative numbers not allowed: -1") do
  StringCalculator.add("-1,2,3")
end

assert_exception("negative numbers not allowed: -1, -3") do
  StringCalculator.add("1,-1,2,-3")
end
