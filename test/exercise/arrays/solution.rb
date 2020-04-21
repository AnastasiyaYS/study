module Exercise
  module Arrays
    class << self
      def max(array)
        max = array.first
        array.each { |item| max = item if item > max }
        max
      end

      def replace(array)
        max_number = max(array)
        array.map { |item| item.positive? ? max_number : item }
      end

      def search(array, query)
        iter = lambda do |array_part, index|
          length = array_part.length
          return -1 if length.zero?

          middle_index = length / 2
          middle_item = array_part[middle_index]
          if query == middle_item
            middle_index + index
          elsif query < middle_item
            iter.call(array_part[0, middle_index], index)
          else
            iter.call(array_part[middle_index + 1, middle_index], index + middle_index + 1)
          end
        end
        iter.call(array, 0)
      end
    end
  end
end
