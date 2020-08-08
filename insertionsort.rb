# for as many numbers listed go through list and put highest number at end of array
def insertion_sort(array)
    for i in 0...array.length  # go through each number in array
        selected_number = array[i].to_i  #set selected number
        if i != 0  # if passed the first number continue
            before_selected = array[i-1].to_i  # set the variable for number before selected number
            if selected_number < before_selected  #if the selected number is larger than the number before
                array.delete_at(i)  # take that number out of array
                for index in 0...array.length # now go through the array and compare selected number to each number in array to determine which two numbers it fits between
                    lower_index = index  # set variable to represent the index for the lower indexed number
                    higher_index = index + 1 # set variable to represent the index for the higher indexed number
                    prev_num = array[lower_index].to_i # use lower index variable to grab the lower indexed number
                    next_num = array[higher_index].to_i # use higher index variable to grab the higher indexed number
                    if selected_number < array[0] # if the selected number is smaller than the first number in array
                        array.unshift(selected_number) # add selected number to beginning of array and break loop
                        break
                    elsif selected_number > prev_num && selected_number < next_num #if selected number is more than lower indexed number and higher than the higher indexed number
                        array.insert(higher_index, selected_number) # add selected number inbetween the two examined numbers break loop
                        break
                    elsif selected_number > prev_num && selected_number == next_num  #if selected number is more than lower indexed number and equal to the higher indexed number
                        array.insert(higher_index, selected_number)  # add selected number inbetween the two examined numbers break loop
                        break
                    end
                end
            end
        end
    end
    return array # return modified numbers array
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
puts "This program will take a list of numbers and sort them using a insertion sort algorithm."
puts "Press enter to begin!"
gets # Creates a pause and needs user input to start program
puts "What is the first number of the series?"
numbers << get_number().to_i # convert the number to integer and push into numbers array
check = ""  # set variable that will be set to exit loop when calculate is typed in
while check != "exit" # continue to add numbers until the check variable is set to exit below
  puts "Please enter a number or type 'sort' to sort "
  new_number = get_number() # use the get_number method to 
  if check_input(new_number) == "number" 
    numbers << new_number.to_i # Convert the new number to interger don't do this in new_number because the string comparison in check_input function
  elsif check_input(new_number) == "exit" # when the user types calculate check_input returns exit
    check = "exit" 
  end
end

p insertion_sort(numbers)
