require 'set'

buffer = []
ARGF.each do |line|
    parent, child_str = line.split " contain "
    parent = parent.delete_suffix(" bags").strip
    child = child_str.split(",").map do |c|
        str = c.strip.gsub(/bags?\.?$/, '')
        str.strip == 'no other' ? [0, ''] : str.split(' ', 2).collect(&:strip)
    end
    buffer.push([parent, child])
end

lookup = {}
buffer.each do |clues|
    parent, childs = clues
    current = lookup.fetch(parent, { parent: Set.new, childs: Set.new })
    childs.each do |c|
        count, bag = c
        next if count == 0
        current[:childs].add(c)
        child_bag = lookup.fetch(bag, { parent: Set.new, childs: Set.new })
        child_bag[:parent].add(parent)
        lookup[bag] = child_bag
    end
    lookup[parent] = current
end

init = lookup["shiny gold"][:parent].to_a
visited = Set.new
while not init.empty?
    bag = init.shift
    next if visited.include? bag
    visited.add(bag)
    init.concat lookup[bag][:parent].to_a
end

puts visited.count