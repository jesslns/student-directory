
@students = [] # an empty array accessible to all methods
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first names
  @name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  until @name.empty? do
    # add student hash to the array
    hash_to_array
    puts "now we have #{@students.count} students"
    # get another name from the user
    @name = STDIN.gets.chomp
  end
end

def hash_to_array (array = @students)
  array << {name: @name, cohort: :november}
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "--------------------------------".center(50)
end

def print_students_list
  i = 0
  until i == @students.length do
    puts "#{@students[i][:name]} (#{@students[i][:cohort]} cohort)".center(50)
    i +=1
  end
end

def print_footer
puts "Overall, we have #{@students.count} great students".center(50)
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  @name, cohort = line.chomp.split(',')
  hash_to_array
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the student"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu
