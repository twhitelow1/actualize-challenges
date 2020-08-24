# for as many numbers listed go through list and put highest number at end of array
def bubblesort(array)
    sorted = []
    
    for i in 0...array.length
        for index in 0...array.length 
            lower_index = index
            higher_index = index + 1
            prev_num = array[lower_index].to_i
            next_num = array[higher_index].to_i
            if prev_num > next_num
                array[higher_index] = prev_num
                array[lower_index] = next_num
            end 
            num_to_add = array[array.length-1]
        end
        array.pop
        sorted.unshift(num_to_add)
    end
    return sorted
end

# Method to check the input that the user gives. 
# If a number typed in return "number" , if "calculate" typed in return "exit", if anything other than that return "error"
def check_input(num)
    if num.match(/\A\d+\Z/) #regex check of string having a number
      return "number"
    elsif num == "sort" # if user types calculate then they are done entering numbers
      return "exit"
    else
      return "error" # if user didn't type calculate or a number then they didn't type in acceptable entry
    end
end

# get the number input then use the input_chk_loop to verify that the input is a number
def get_number
    input = gets.chomp
    # continue to ask for a number until you get one. check_input checks for a number and if it isn't a number or calculate it returns error
    while check_input(input) == "error"     
      puts "Please only input a number"
      input = gets.chomp
    end
    return input
end

numbers = []
puts "This program will take a list of numbers and sort them using a bubble sort algorithm."
puts "Press enter to begin!"
gets # Creates a pause and needs user input to start program
puts "What is the first number of the series?"
numbers << get_number().to_f # convert the number to float and push into numbers array
check = ""  # set variable that will be set to exit loop when calculate is typed in
while check != "exit" # continue to add numbers until the check variable is set to exit below
  puts "Please enter a number or type 'sort' to sort "
  new_number = get_number() # use the get_number method to 
  if check_input(new_number) == "number" 
    numbers << new_number.to_f # Convert the new number to float don't do this in new_number because the string comparison in check_input function
  elsif check_input(new_number) == "exit" # when the user types calculate check_input returns exit
    check = "exit" 
  end
end

p bubblesort(numbers)
