class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

      delimiter = /[\n,]/

      if numbers.start_with?("//")
        custom_delimiter, numbers = numbers[2..].split("\n", 2)
        delimiter = Regexp.new(Regexp.escape(custom_delimiter.strip))
      end

      nums = numbers.split(delimiter).map(&:strip).map(&:to_i)

      negative_numbers = nums.select { |n| n < 0 }
      unless negative_numbers.empty?
        raise "negative numbers not allowed: #{negative_numbers.join(', ')}"
      end

      nums.sum
  end
end
