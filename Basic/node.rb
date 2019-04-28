class Node
    attr_accessor :value, :next_node, :previous_node

    def initialize(value, previous_node = nil, next_node = nil)
        @value = value
        @previous_node = previous_node
        @next_node = next_node
    end
end
