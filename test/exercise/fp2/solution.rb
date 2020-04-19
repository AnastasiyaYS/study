module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        for item in self
          func.call(item)
        end
      end

      # Написать свою функцию my_map
      def my_map(&func)
        result = MyArray.new
        my_each(&(->(item) { result << func.call(item) }))
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_each(&(->(item) { result << item unless item.nil? }))
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &func)
        arr = acc.nil? ? self[1, length - 1] : self
        acc = acc.nil? ? first : acc
        arr.my_each(&(->(item) { acc = func.call(acc, item) }))
        acc
      end
    end
  end
end
