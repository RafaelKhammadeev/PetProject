# Задача 1. Напишите программу, которая выводит на экран числа от 1 до 100. При этом вместо чисел, кратных 3,
# программа должна выводить слово «Hi», а вместо чисел, кратных 5 — слово «By». Если число кратно
# и 3, и 5, то программа должна выводить слово «HiBy».

(1..100).each do |number|
  if (number % 15).zero?
    puts("#{number}: HiBy")
  elsif (number % 5).zero?
    puts("#{number}: By")
  elsif (number % 3).zero?
    puts("#{number}: Hi")
  end
end

# Задача 2. Имеется строка набранная в разном регистре, например: «ВотТакаяСтрока» требуется получить в
# результате строку где буквы меняют регистр, то есть: «вОТтАКАЯсТРОКА».

def change_case(str)
  change_case_str = ''

  str.each_char do |char|
    if char.upcase == char
      change_case_str << char.downcase
    else
      change_case_str << char.upcase
    end
  end

  change_case_str
end

str = 'ВотТакаяСтрока'
res = change_case(str)
puts res
# Либо просто использовать метод Ruby:)
puts str.swapcase

# Задача 3. Дана строка s и словарь dict, содержащий некие слова. Определите, можно ли строку
# s сегментировать в последовательность разделенных пробелом слов, содержащихся в словаре dict.

def word_segmentation(str, word_dict)
  str_length = str.length
  states = [false] * (str_length + 1)
  states[str_length] = true

  (str_length - 1).downto(0) do |i|
    word_dict.each do |word|
      # puts("#{str.slice(i..i + word.length - 1)}, #{word}")
      # puts("#{i + word.length}, #{str_length}")
      slice_str = str[i..(i + word.length - 1)]
      if (i + word.length) <= str_length && slice_str == word
        states[i] = states[i + word.length]
      end

      break if states[i]
    end
  end

  states[0]
end

word_dict = %w[два десятка девятка]
s = 'двадесятка'
res = word_segmentation(s, word_dict)
puts res

# Задача 4. Найдите непрерывный подмассив в массиве (содержащем как минимум 1 элемент),
# который имеет максимальную сумму элементов.
def max_sequence(sequence)
  max_sum = sequence[0]
  partial_sum = sequence[0]
  start_ind = 0
  end_ind = 0
  (0..sequence.length - 1).each do |ind|
    if sequence[ind] > partial_sum + sequence[ind]
      partial_sum = sequence[ind]
      start_ind = ind
    else
      partial_sum += sequence[ind]
    end

    if partial_sum > max_sum
      max_sum = partial_sum
      end_ind = ind
    end
  end

  sequence[start_ind..end_ind]
end

sequence = [-1, -13, -2, 1, -3, 4, -1, 2, 1, -5, 4]
res = max_sequence(sequence)
puts res.inspect

# Задача 5. Дан треугольник. Найдите минимальный путь от вершины до основания.
# На каждом шаге вы можете двигаться только на соседние цифры, находящиеся в ряду ниже.

def minimum_triangle_sum(triangle)
  states = [0] * (triangle.length + 1)

  triangle.reverse_each do |row|
    row.each_with_index do |num, ind|
      states[ind] = num + [states[ind], states[ind + 1]].min
    end
  end

  states[0]
end

triangle = [[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]]
res = minimum_triangle_sum(triangle)
puts res


# Задача 6. Кладовщику выдается случайный перечень ячеек, из которых требуется взять товар.
# Помогите составить маршрут передвижения кладовщика по складу, начиная движение
# от стола, таким образом, чтобы он затратил минимально возможный путь.

# Рисунок со стелажами можно представить в виде графа:
#
# 1----2-----3-----4
# |    |     |     |
# 5    6     7     8
# |    |     |     |
# 9    10    11    12
# |    |     |     |
# 13   14    15    16
# |    |     |     |
# 17   18    19    20
# |    |     |     |
# 21   22    23    24
# |    |     |     |
# 25   26    27    28
# |    |     |     |
# 29---30----31----32
#
# Допустим, что пути между любыми соседними точками стоят одинаково и направление значения не имеет.
# Точку 29 полностью занимает стол, а началом пути служат точки 25 или 30.

# Алгоритм:
# 1. Создам граф, представляющий местоположение стеллажей и их соединений в виде ребер между узлами(ячейками).
# 2. Использую алгоритма обхода в глубину для нахождения всех возможных путей от стартовой точки (стола) до целевых
# ячеек, которые необходимо посетить.
# 3. Фильтрую пути так, чтобы оставить только те, которые проходят через все целевые ячейки.
# 4. Нахожу все возможные пути обратно от целевых ячеек до стартовой точки (возвращение кладовщика на стол).
# 5. Создаю все возможные комбинаций путей туда и обратно.
# 6. Нахожу комбинации с минимальным суммарным расстоянием пути.

# Данное решение алгоритм обхода в глубину просчитывает все возможные варианты маршрутов, и он
# оптимален для данной задачи. Он гарантирует нахождение наименьшего пути для кладовщика, посещающего все указанные
# ячейки на складе и возвращающегося на стартовую точку (стол).
