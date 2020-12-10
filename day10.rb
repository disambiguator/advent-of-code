file = File.read('./inputs/day10')
@lines = file.split("\n").map(&:to_i).sort

inputs = [0] + @lines + [@lines.last + 3]

v = inputs.map.with_index do |l, i|
    if i == inputs.length - 1
        nil
   else
    inputs[i + 1] - l
   end
end

part1 = v.count {|i| i == 1} * v.count {|i| i == 3}

@visited = {}

def count(input)
    return 1 if input[1].nil?

    [1,2,3].map do |i|
        input[i] && input[i] <= input[0] + 3 ? result(input[i..]) : 0
    end.sum
end

def result(input)
    x = @visited[input]
    return x if x

    r = count(input)
    @visited[input] = r

    return r
end

part2 = result(inputs)
puts part2
puts part2 == 74049191673856