input = File.read('./inputs/day8').split("\n")
sum = input.sum { |l|
    digits, output = l.split(" | ").map { |i| i.split.map { |x| x.chars.sort.join } }
    possibilities = {}

    digits = digits.map { |d|
        c = d.chars
        if c.length == 2
            possibilities[1] = d
            nil

        elsif c.length == 3
            possibilities[7] = d
            nil

        elsif c.length == 4
            possibilities[4] = d
            nil

        elsif c.length == 7
            possibilities[8] = d
            nil
        else
            d
        end
    }.compact

    digits = digits.map { |d|
        if d.delete(possibilities[1]).length == 3
            possibilities[3] = d
            nil
        elsif d.delete(possibilities[1]).length == 5
            possibilities[6] = d
            nil
        else
            d
        end
    }.compact

    digits = digits.map { |d|
        if d.delete(possibilities[6]).length == 0
            possibilities[5] = d
            nil
        else
            d
        end
    }.compact

    digits = digits.map { |d|
        if d.delete(possibilities[5]).length == 1
            possibilities[9] = d
            nil
        else
            d
        end
    }.compact

    digits = digits.map { |d|
        if d.delete(possibilities[3]).length == 1
            possibilities[2] = d
            nil
        else
            possibilities[0] = d
            nil
        end
    }.compact

    puts possibilities.inspect
    puts digits.inspect
    # {"a"=>"cf", "b"=>"cf", "c"=>"abcdefg", "d"=>"acf", "e"=>"bcdf", "f"=>"bcdf", "g"=>"abcdefg"}
    # {"a"=>"cf", "b"=>"cf", "c"=>"abcdefg", "d"=>"a", "e"=>"bd", "f"=>"bd", "g"=>"abdeg"}
    # {"a"=>"cf", "b"=>"cf", "c"=>"aeg", "d"=>"a", "e"=>"bd", "f"=>"bd", "g"=>"aeg"}
    # {"a"=>"cf", "b"=>"cf", "c"=>"eg", "d"=>"a", "e"=>"bd", "f"=>"bd", "g"=>"eg"}
    # numbers = digits.map { |v| real[v] }
    # puts numbers

    e = output.map do |o|
        possibilities.key(o)
    end
    e.join.to_i
}

puts sum
# input = "acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf"
