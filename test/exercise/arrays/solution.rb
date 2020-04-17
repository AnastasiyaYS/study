module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |item| item.positive? ? array.max : item }
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
          else iter.call(array_part[middle_index + 1, middle_index], index + middle_index + 1)
          end
        end
        iter.call(array, 0)
      end
    end
  end
end
