class StringCalculator
 def self.add(numbers)
  return 0 if numbers.empty?
  
  if numbers.start_with?("//")
    delimeter, numbers = numbers[2..].split("\n", 2)
    numbers.split(delimeter).map{|n| n.to_i}.sum
  else
  numbers.split(/[\n,]/).map{|n| n.to_i}.sum
  end
 end
end