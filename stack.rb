load "node.rb"

class Stack
    def initialize()
        @tail = nil
    end

    def push(number)
        this_node = Node.new(number)
        if @tail.nil?
            @tail = this_node
        else
            this_node.previous_node = @tail
            @tail.next_node = this_node
            @tail = this_node
        end
        return this_node.value
    end

    def pop
        return "Stack is Empty!" if @tail == nil
        to_pop = @tail
        @tail = @tail.previous_node
        if @tail.nil?
            @tail = nil
        end
        return to_pop.value
    end

    def read
        return "Stack is Empty!" if @tail == nil
        return @tail.value
    end

    def empty?
        return @tail == nil ? true : false
    end
end

