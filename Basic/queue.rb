load "node.rb"

class Queue
    def initialize()
        @tail = nil
        @head = nil
    end

    def push(number)
        this_node = Node.new(number)
        if @tail.nil?
            @tail = this_node
            @head = this_node
        else
            @tail.next_node = this_node
            this_node.previous_node = @tail
            @tail = this_node
        end
        return this_node.value
    end

    def read()
        return @head == nil ? "Queue is Empty!" : @head.value
    end

    def pop()
        return "Queue is Empty" if @head.nil?
        to_pop = @head
        if @head.next_node.nil?
            @head = nil
            @tail = nil
        else
            @head = @head.next_node
        end
        return to_pop.value
    end

    def empty?
        return @head == nil ? true : false
    end
end
