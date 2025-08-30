class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers == ""
    delimiters = [',', "\n"]
    nums = numbers.split(Regexp.union(delimiters)).map(&:to_i)
    nums.sum
  end
end