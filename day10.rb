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

    a = input[0]
    b = input[1]
    c = input[2]
    d = input[3]
    e = input[4]

    return result(input[1..]) if b == a + 3

    if b == a + 2
        sum = result(input[1..])
        return sum if c.nil?

        if c == a + 3
            return sum + result(input[2..])
        elsif c == a + 2 && !d.nil? && d == a + 3
            return sum + result(input[2..]) + result(input[3..])
        end
    end

    if b == a + 1
        if c.nil?
            return result(input[1..])
        elsif c == a + 3 || c == a + 2 && d.nil?
            return result(input[1..]) + result(input[2..])
        elsif c == a + 2 && d == a + 3
            return result(input[1..]) + result(input[2..]) + result(input[3..])
        elsif c == a + 2
            return result(input[1..]) + result(input[2..])
        else
            return result(input[1..])
        end
    end
end

def result(input)
    x = @visited[input]
    return x if x

    r = count(input)
    @visited[input] = r

    return r
end

part2 = result(inputs)