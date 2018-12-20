def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first names
  name = gets.chomp
  # while the name is not empty, repeat this code
  until name.empty? do
    # add student hash to the array
    students << {name: name, cohort: :november}
    puts "now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of input_students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "--------------------------------".center(50)
end

def print(students)
  i = 0
  until i == students.length - 1 do
    puts "#{students[i][:name]} (#{students[i][:cohort]} cohort)".center(50)
    i +=1
  end
end

def print_footer(names)
puts "Overall, we have #{names.count} great students".center(50)
end

def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the student"
    puts "9. Exit"
    selection = gets.chomp
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
