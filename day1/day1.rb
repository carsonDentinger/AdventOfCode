input = File.read("input.txt").lines.map(&:strip)

left_column, right_column = input.map { |line| line.split.map(&:to_i) }.transpose

left_column.sort!
right_column.sort!

answer = 0

left_column.each_with_index do |left_value, index|
  right_value = right_column[index]
  if left_value >= right_value
    answer += (left_value - right_value)
  else 
    answer += (right_value - left_value)
  end     
end

# Pt 1 answer
puts answer

similarity_score = 0

left_column.each do |value|
  similarity_score += (value * right_column.count(value))
end

# Pt 2 answer
puts similarity_score

