def merge_sort(arr)
  return arr if arr.length == 1

  middle = arr.length / 2
  left = arr[0...middle]
  rigth = arr[middle..-1]
  
  left = merge_sort(left)
  rigth = merge_sort(rigth)

  merge(left, rigth)
end

def merge(left, rigth)
  result = []

  until left.empty? || rigth.empty?
    if left.first <= rigth.first
      result << left.shift
    else
      result << rigth.shift
    end
  end

  result.concat(left).concat(rigth)
end

def clear_values(arr)
  strings = []
  numbers = []
  clear = []  

  clear = arr.reject do |element|
    element == true ||
    element == false ||
    element.nil?
  end

  return clear if clear.all?(String) || clear.all?(Numeric)
                   
  clear.each do |element|
      if element.is_a?(String)
        strings << element
      elsif element.is_a?(Numeric)
        numbers << element
      end
  end

  choose = ''
  puts 'what do you want to order'
  until choose == 'numbers' || choose == 'strings'
    print 'numbers or strings: '
    choose = gets.chomp.downcase
  end

  return numbers if choose == 'numbers'
  return strings
end

num = [3, 7, 8, 2, 1, 5, 4, 6]
str = ['b', 'd', 'c', 'a']
tfnil = [
  1, 2, 3, nil, false, true, 'a', 'j', 'c', 'b'
]

verify = clear_values(tfnil)
puts "Arranged: #{merge_sort(verify)}"


