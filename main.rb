require 'tsort'

# 1 - 4   6
#  \   \ / \
#   9 - 5 - 7 - 8
#      /
# 2 - 3
#
h = {
  1 => [],
  2 => [],
  3 => [2],
  4 => [1],
  5 => [3, 4, 9],
  6 => [5],
  7 => [5, 6],
  8 => [7],
  9 => [1],
}

each_node = -> (&b) { h.each_key(&b) }
each_child = -> (key, &b) { h[key].each(&b) }

p TSort.tsort(each_node, each_child)
