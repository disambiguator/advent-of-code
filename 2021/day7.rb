crabs = File.read('./inputs/day7').split(',').map(&:to_i)

# puts crabs.inspect
# crabs = crabs_original.dup
# while crabs.uniq.length != 1 do
#     mode = crabs.tally.sort.max_by {|v| v[1] }[0]
#     furthest = crabs.max_by {|v| (v - mode).abs }
#     crabs.map! { |v| v == furthest ? ( mode > v ? v + 1 : v - 1 ) : v }
#     puts crabs.inspect
# end
# # puts crabs.sum/crabs.rubylength
# # puts crabs.tally.sort.inspect
# # puts mode
# mode = crabs[0]
# puts crabs_original.sum {|v| (v - mode).abs }
# # 342641

# part 2

min = crabs.length.times.map do |i|
    crabs.sum {|v| (0..(v - i).abs).sum }
end.min
puts min
# puts min == 93006301
