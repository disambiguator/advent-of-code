require 'pry'
file = File.read('./inputs/day11')
@rows = file.split("\n").map { _1.split '' }

def iterate_part_one(seats)
    seats.map.with_index { |row, i|
        row.map.with_index { |seat, j|
            adj = [
                seats[i+1] && seats[i+1][j],
                seats[i+1] && seats[i+1][j+1],
                j > 0 && seats[i+1] && seats[i+1][j-1],
                i > 0 && seats[i-1][j],
                i > 0 && seats[i-1][j+1],
                j > 0 && i > 0 && seats[i-1][j-1],
                seats[i][j+1],
                j > 0 && seats[i][j-1],
            ]

            case seat
            when '.'
                '.'
            when 'L'
                adj.include?('#') ? 'L' : '#'
            when '#'
               adj.count { _1 == '#' } > 3 ? 'L': '#'
            end
        }
    }
end

r = @rows
while true
    nr = iterate_part_one(r)
    break if r == nr
    r = nr
end

part1 = r.flatten.count { _1 === '#' }

@width = @rows[0].length
@length =  @rows.length

def look(seats, i, j, x, y)
    if i >= 0 && i < @length && j >= 0 && j < @width
        if seats[i].nil?
            puts seats.inspect, i, j
        end
        case seats[i][j]
        when '#'
              true
        when 'L'
            false
        else
            look(seats, i + x, j + y, x, y)
        end
    else
        false
    end
end

def iterate_part_two(seats)
    seats.map.with_index { |row, i|
        row.map.with_index { |seat, j|

            adj = [
                look(seats, i + 1, j, 1, 0),
                look(seats, i + 1, j + 1, 1, 1),
                look(seats, i + 1, j - 1, 1, -1),
                look(seats, i - 1, j, -1, 0),
                look(seats, i - 1, j + 1, -1, 1),
                look(seats, i - 1, j - 1, -1, -1),
                look(seats, i, j + 1, 0, 1),
                look(seats, i, j - 1, 0, -1)
            ]

            case seat
            when '.'
                '.'
            when 'L'
                adj.include?(true) ? 'L' : '#'
            when '#'
               adj.count { _1 } > 4 ? 'L': '#'
              end
        }
    }
end

r = @rows
while true
    nr = iterate_part_two(r)

    # system "clear"
    # puts nr.map { _1.join('') }.join("\n")
    # sleep 0.1

    break if r == nr
    r = nr
end

puts r.flatten.count { _1 === '#' }