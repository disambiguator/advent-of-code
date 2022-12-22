lines = File.read('./inputs/day5').split("\n").map do |l|
    l.split(" -> ").map {|c| c.split(",").map(&:to_i) }
end

vents = []

# lines.each do |i, o|
#     x0, y0 = i
#     x1, y1 = o

#     if x0 == x1
#         puts 'x'
#         Range.new(*([y0,y1].sort)).each do |i|
#             vents[x0] ||= []
#             vents[x0][i] ||= 0
#             vents[x0][i] += 1
#         end
#     end

#     if y0 == y1
#         puts 'y'
#         Range.new(*([x0,x1].sort)).each do |i|
#             puts i
#             vents[i] ||= []
#             vents[i][y0] ||= 0
#             vents[i][y0] += 1
#         end
#     end

#     puts [x0, y0, x1, y1].inspect
#     # vents.each do |v|
#     #     puts v.map {|x| x || '.' }.join
#     # end
# end

# vents.each do |v|
#     puts v.map {|x| x || '.' }.join
# end

# sum = vents.compact.sum do |v|
#     v.compact.count {|i| i > 1 }
# end

# puts sum
# 5585

lines.each do |i, o|
    y0, x0 = i
    y1, x1 = o

    if x0 == x1
        puts 'x'
        Range.new(*([y0,y1].sort)).each do |i|
            vents[x0] ||= []
            vents[x0][i] ||= 0
            vents[x0][i] += 1
        end
    elsif y0 == y1
        puts 'y'
        Range.new(*([x0,x1].sort)).each do |i|
            vents[i] ||= []
            vents[i][y0] ||= 0
            vents[i][y0] += 1
        end
    elsif ((x1 - x0)/(y1 - y0)).abs == 1
        puts 'diag'
        puts [x0, y0, x1, y1].inspect
        xrange = (x1 > x0 ? x0..x1 : x0.downto(x1)).to_a
        yrange = (y1 > y0 ? y0..y1 : y0.downto(y1)).to_a
        # puts [xrange,yrange].transpose.inspect
        [xrange, yrange].transpose.map do |x,y|
            vents[x] ||= []
            vents[x][y] ||= 0
            vents[x][y] += 1
        end
    end

    # vents.each do |v|
    #     puts (v || [nil]).map {|x| x || '.' }.join
    # end
end

# vents.each do |v|
#     puts (v || [nil]).map {|x| x || '.' }.join
# end

sum = vents.compact.sum do |v|
    v.compact.count {|i| i > 1 }
end

puts sum
