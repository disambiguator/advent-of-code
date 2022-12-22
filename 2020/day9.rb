file = File.read('./inputs/day9')
@lines = file.split("\n").map(&:to_i)

@pre = 25

def sums(n)
    {}.tap do |s|
        (n - @pre..n - 1).each do |i|
            (i..i + @pre - 1).each do |j|
                s[@lines[i] + @lines[j]] = true
            end
        end
    end
end

n = ((@pre..@lines.length - 1).find do |n|
    !(sums(n)[@lines[n]])
end)

@invalid = @lines[n]

puts "Invalid: #{@invalid}"

def search(n)
    sum = @lines[n]
    j = n + 1
    while true
        sum+=@lines[j]
        if sum > @invalid
            return nil
        end

        if sum == @invalid
            return @lines[n..j].min + @lines[n..j].max
        end

        j+= 1
    end
end

part2 = nil
(0..@lines.length - 1).each do |n|
    i = search(n)
    if i
        part2 = i
        break
    end
end

puts part2
