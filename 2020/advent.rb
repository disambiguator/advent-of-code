file = File.read('./input')
lines = file.split("\n")

@struct = lines.map do |l|
    line = l.tr('.', '').gsub('bags', 'bag')
    tokens = line.split(' bag contain ')

    outer = tokens[0]

    inner_groups = tokens[1].split(', ')
    inner = inner_groups.map do |group|
        keys = group.split(' ')

        if keys[0] == 'no'
            { number: 0, type: 'none' }
        else
            { number: keys[0].to_i, type: keys[1..].join(' ').gsub(' bag', '') }
        end
    end

    [outer, inner]
end.to_h

k = @struct.keys[0]
def num_gold(v)
    return 0 if v[:type] == 'none'

    if v[:type] == 'shiny gold'
        v[:number]
    else
        child = @struct[v[:type]]

        x = child.map do |c|
            num_gold(c)
        end.sum

        v[:number] * x
    end
end

# puts (@struct.keys.map do |k|
#     @struct[k].map do |v|
#         num_gold(v)
#     end.sum > 0 ? 1 : 0
# end.sum)


def num_bags(v)
    puts v[:type]
    return 0 if v[:type] == 'none'

    child = @struct[v[:type]]
    childs_bags = child.map do |c|
        x = num_bags(c)
        x
    end.sum

    puts 'num bags for ' + v.inspect + (1 + v[:number] * childs_bags).to_s
    v[:number] * (1 + childs_bags)
end

puts (@struct['shiny gold'].map do |v|
    num_bags(v)
end.sum)

# light red bags contain 1 bright white bag, 2 muted yellow bags.
# dark orange bags contain 3 bright white bags, 4 muted yellow bags.
# bright white bags contain 1 shiny gold bag.
# muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
# shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
# dark olive bags contain 3 faded blue bags, 4 dotted black bags.
# vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
# faded blue bags contain no other bags.
# dotted black bags contain no other bags.

# So, a single shiny gold bag must contain 1 dark olive bag
# (and the 7 bags within it) plus 2 vibrant plum bags (and the 11 bags within each of those)
 #: 1 + 1*7 + 2 + 2*11 = 32 bags!
