
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
  file = File.open(@student_file, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = @student_file)
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
  puts
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
      puts "\n Students were added successfully."
    when "2"
      show_students
      puts "\n Students were listed successfully."
    when "3"
      puts "Please enter the file name to save as and hit return."
      @student_file= STDIN.gets.chomp
      save_students
      puts "\n Student information saved successfully."
    when "4"
      puts "Please enter the file name that you want to load and hit return."
      @student_file= STDIN.gets.chomp
      load_students
      puts "\n Students data were loaded successfully"
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
