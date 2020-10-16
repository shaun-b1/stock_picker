require "pry"

#We are looking at an array of numbers, finding the highest value element, finding the lowest value element before it, and returning an array that contains the indices of the two elements

#Does your program have a user interface? What will it look like? What functionality will the interface have? Sketch this out on paper.
  #No, no user interface

#What inputs will your program have? Will the user enter data or will you get input from somewhere else?
  #none

#What’s the desired output?
  #The desired output is an array that contains the indices of the two days in the array that provide the greatest difference.

#Given your inputs, what are the steps necessary to return the desired output?

  #Loop through the array
  #Compare the element with all elements after it
  #push the indices of the two elements with the greatest difference to a new array
  #return the new array

def stock_picker(array)
dates_array = []

if array.sort[-1] != array.first
  dates_array.push(array.find_index {|i| i == array.sort[-1]})

  if array.sort[0] != array.last && array.find_index {|i| i == array.sort[0]} < array.find_index {|i| i == array.sort[-1]}
    dates_array.push(array.find_index {|i| i == array.sort[0]})

  elsif array.sort[0] != array.last && array.find_index {|i| i == array.sort[1]} < array.find_index {|i| i == array.sort[-1]}
    dates_array.push(array.find_index {|i| i == array.sort[1]})
  end

elsif array.sort[-1] == array.first
  dates_array.push(array.find_index {|i| i == array.sort[-2]})

  if array.sort[0] != array.last && array.find_index {|i| i == array.sort[0]} < array.find_index {|i| i == array.sort[-2]}
    dates_array.push(array.find_index {|i| i == array.sort[0]})

  elsif array.sort[0] != array.last && array.find_index {|i| i == array.sort[1]} < array.find_index {|i| i == array.sort[-2]}
    dates_array.push(array.find_index {|i| i == array.sort[1]})
  end
end

p dates_array.sort
end

stock_picker([17,3,6,9,15,8,6,1,10])

=begin
# create an array 0...prices.length representing each day
  ((0...prices.length).to_a)
# create an array of all day pairings
    .repeated_permutation(2)
# create an array of all pairings where first day is earlier than second day
    .select {|start, finish| finish > start}
# find the pair with the greatest difference
    .max_by {|start, finish| prices[finish] - prices[start]}
=end
