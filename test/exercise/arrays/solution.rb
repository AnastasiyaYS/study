module Exercise
  module Arrays
    class << self
      def replace(array)
        max = lambda do |full_array|
          iter = lambda do |part_of_array, max_number|
            return max_number if part_of_array.empty?

            max_number = max_number < part_of_array[0] ? part_of_array[0] : max_number
            iter.call(part_of_array[1, part_of_array.length - 1], max_number)
          end
          iter.call(full_array, full_array[0])
        end
        max_number = max.call(array)

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
          else iter.call(array_part[middle_index + 1, middle_index], index + middle_index + 1)
          end
        end
        iter.call(array, 0)
      end
    end
  end
end
