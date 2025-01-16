class StringCalculator
 def self.add(numbers)
  return 0 if numbers.empty?
  
  numbers.split(',').map{|n| n.to_i}.sum
 end
end