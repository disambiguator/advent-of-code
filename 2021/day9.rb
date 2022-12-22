require 'set'
input = File.read('./inputs/day9').split("\n").map {|i| i.split("").map(&:to_i) }

#part1
sum = (0..input.length - 1).sum do |i|
    (0..input[0].length - 1).sum do |j|
        v = input[i][j]
        adj = [[i,j+1],[i,j-1],[i+1,j],[i-1,j]].filter {|x,y|
            y < input[0].length &&
            y >= 0 &&
            x >= 0 &&
            x < input.length
        }

        values = adj.map {|x, y| input[x][y] }
        if values.all? {|a| v < a}
            # puts [i,j].inspect
            v + 1
        else
            0
        end
    end
end

# puts sum
# puts sum == 506

# part 2

@input = input
@found = Set.new

def traverse(i,j)
    return 0 if @found.member?([i,j])
    @found.add([i,j])

    puts [i,j].inspect

    adj = [[i,j+1],[i,j-1],[i+1,j],[i-1,j]].filter {|x,y|
        y < @input[0].length &&
        y >= 0 &&
        x >= 0 &&
        x < @input.length &&
        @input[x][y] != 9 &&
        @input[x][y] > @input[i][j]
    }

    1 + adj.sum do |x,y|
        traverse(x,y)
    end
end

basins = []

(0..input.length - 1).each do |i|
    (0..input[0].length - 1).each do |j|
        v = input[i][j]
        adj = [[i,j+1],[i,j-1],[i+1,j],[i-1,j]].filter {|x,y|
            y < input[0].length &&
            y >= 0 &&
            x >= 0 &&
            x < input.length
        }

        values = adj.map {|x, y| input[x][y] }
        if values.all? {|a| v < a}
            puts 'basin'
            basins.push(traverse(i,j))
        end
    end
end

puts basins.sort.reverse[0..2].inject(:*) == 931200
