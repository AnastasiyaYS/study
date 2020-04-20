module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_array = array.select do |film|
          !film['country'].nil? && film['country'].split(',').length >= 2 &&
            !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f != 0
        end
        rating_sum = filtered_array.reduce(0) { |sum, film| sum + film['rating_kinopoisk'].to_f }
        rating_sum / filtered_array.length
      end

      def chars_count(films, threshold)
        filtered_films = films.select { |film| !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f >= threshold }
        filtered_films.reduce(0) { |i_letter_count, film| i_letter_count + film['name'].count('и') }
      end
    end
  end
end
