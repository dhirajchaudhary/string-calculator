class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers == ""

    delimiters = [',', "\n"]
    numbers_section = numbers

    if numbers.start_with?('//')
      header, numbers_section = numbers.split("\n", 2)
      delimiter_part = header[2..-1]
      # support [delim] style (multi-char) OR single-char delimiter
      if delimiter_part.start_with?('[')
        delimiters += delimiter_part.scan(/\[([^\]]+)\]/).flatten
      else
        delimiters << delimiter_part
      end
    end

    regex = Regexp.union(delimiters)
    nums = numbers_section.split(regex).map(&:strip).reject(&:empty?).map(&:to_i)

    negatives = nums.select { |n| n < 0 }
    unless negatives.empty?
      raise ArgumentError, "negative numbers not allowed: #{negatives.join(',')}"
    end

    nums.sum
  end
end