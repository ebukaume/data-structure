class Node
    attr_accessor :value, :previous_node, :next_node

    def initialize(value, previous_node=nil, next_node=nil)
        @value = value
        @previous_node = previous_node
        @next_node = next_node
    end
end

class LinkedList
    def initialize()
        @head = nil
        @tail = nil
    end

    def push_end(number)
        this_node = Node.new(number)
        if @head.nil?
            @head = this_node
            @tail = this_node
            return this_node.value
        end
        @tail.next_node = this_node
        this_node.previous_node = @tail
        @tail = this_node
        return this_node.value
    end

    def push_front(number)
        this_node = Node.new(number)
        if @head.nil?
            @head = this_node
            @tail = this_node
            return this_node.value
        end
        @head.previous_node = this_node
        this_node.next_node = @head
        @head = this_node
        return this_node.value
    end

    def push_at(index, number)
        this_node = Node.new(number)
        if @head.nil? and index == 0
            @head = this_node
            @tail = this_node
            return this_node.value
        end
        begin
            current_node = @head
            index.times do
                current_node = current_node.next_node
            end
            this_node.previous_node = current_node.previous_node
            current_node.previous_node.next_node = this_node
            current_node.previous_node = this_node
            this_node.next_node = current_node
            return this_node.value
        rescue
            return "Index Out of Range!"
        end
    end

    def pop_end()
        if @tail.nil? 
            return "List is empty"
        end
        to_pop = @tail
        @tail = @tail.previous_node
        @tail.next_node = nil
        return to_pop.value
    end

    def pop_front()
        if @head.nil?
            return "List is empty"
        end
        to_pop = @head
        @head = @head.next_node
        @head.previous_node = nil
        return to_pop.value
    end

    def delete_at(index)
        if @head.nil?
            return "List is empty"
        end
        current_node = @head
        begin
            index.times do
                current_node = current_node.next_node
            end
            current_node.previous_node.next_node = current_node.next_node
            current_node.next_node.previous_node = current_node.previous_node
            return current_node.value
        rescue
            return "Index Out of Range!"
        end
    end

    def read_at(index)
        if @head.nil?
            return "List is empty"
        end
        current_node = @head
        begin
            index.times do
                current_node = current_node.next_node
            end
            return current_node.value
        rescue
            return "Index Out of Range!"
        end
    end

    def read_all()
        if @head.nil?
            return "List is empty"
        end
        current_node = @head
        output = "#{current_node.value}"
        until current_node.next_node.nil?
            current_node = current_node.next_node
            output += ", #{current_node.value}"
        end
        return output
    end
    
    def empty()
        if @head.nil?
            return true
        end
        return false
    end
end

# list = LinkedList.new()
# puts list.empty()
# puts list.push_at(0,12)
# puts list.empty()
# puts list.push_end(11)
# puts list.push_end(22)
# puts list.push_end(33)
# puts list.push_at(1,120)
# puts list.push_at(2,1200)
# puts list.push_at(3,12000)

# # 0 120 1200 10 

# puts list.read_all()
# # puts list.read_at(0)
# puts "************"
# puts list.read_at(2)
# puts list.read_all()
