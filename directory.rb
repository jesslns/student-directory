
@students = [] # an empty array accessible to all methods
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first names
  name = gets.chomp
  # while the name is not empty, repeat this code
  until name.empty? do
    # add student hash to the array
    @students << {name: name, cohort: :november}
    puts "now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
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

def print_menu
  puts "1. Input the students"
  puts "2. Show the student"
  puts "9. Exit"
end

def show_students
  print_header
  print(@students)
  print_footer(@students)
end

def interactive_menu
  loop do
    print_menu
    selection = gets.chomp
    case selection
      when "1"
        input_students
      when "2"
        show_students
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
