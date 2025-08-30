class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers == ""

    delimiters = default_delimiters
    numbers_section = numbers

    if numbers.start_with?('//')
      header, numbers_section = numbers.split("\n", 2)
      delimiters += parse_delimiters_from_header(header[2..-1])
    end

    nums = split_numbers(numbers_section, delimiters)
    negatives = nums.select { |n| n < 0 }
    unless negatives.empty?
      raise ArgumentError, "negative numbers not allowed: #{negatives.join(',')}"
    end

    nums.sum
  end

  private

  def default_delimiters
    [',', "\n"]
  end

  def parse_delimiters_from_header(delimiter_part)
    if delimiter_part.start_with?('[')
      delimiter_part.scan(/\[([^\]]+)\]/).flatten
    else
      [delimiter_part]
    end
  end

  def split_numbers(numbers_section, delimiters)
    regex = Regexp.union(delimiters)
    numbers_section.split(regex).map(&:strip).reject(&:empty?).map(&:to_i)
  end
end