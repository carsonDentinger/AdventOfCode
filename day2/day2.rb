def valid_ascending?(array)
  array.each_with_index do |value, index|
    next if index == array.length - 1
    
    next_value = array[index + 1]
    
    if next_value <= value || next_value - value > 3
      return false
    end
  end
  
  true
end

def valid_descending?(array)
  array.each_with_index do |value, index|
    next if index == array.length - 1

    next_value = array[index + 1]

    if next_value >= value || value - next_value > 3 || value - next_value < 1
      return false
    end
  end

  true
end

input = File.readlines("input.txt").map(&:chomp)

levels = input.map { |line| line.split.map(&:to_i) }

safe_levels = 0

levels.each do |array|
  if valid_ascending?(array) || valid_descending?(array)
    safe_levels += 1
  end  
end

puts safe_levels