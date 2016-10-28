@students = []
require 'csv'
def interactive_menu
  try_load_students
  loop do
    print_menu
    process($stdin.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list"
  puts "9. Exit"
end

def show_students
  print_header
  print_by_cohorts
  print_footer
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
      puts "I don't know what you meant. Try again."
    end
end

def print_header
  puts "The students of Villians Academy".center(50)
  puts "-------------".center(50)
end

def print_names(names)
  if !names.empty?
    t = 0
        while names[t] != nil
          if names[t][:name].to_s.downcase.chars.first == 'd' && names[t][:name].to_s.length < 12
            puts "#{t + 1}. #{names[t][:name]} (#{names[t][:cohort]} cohort).".center(50)
            puts "They like #{names[t][:hobby]}".center(50)
            puts "They're #{names[t][:height]}cm tall".center(50)
            puts "They were born in #{names[t][:country_of_birth]}.".center(50)
            t += 1
          else
            t += 1
          end
        end
  end
end

def print_footer
  puts "Overall we have #{@students.count} great students.".center(50)
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice."
  name = $stdin.gets.gsub(/\n/, "").to_sym
  puts "Please enter their Cohort (Note: Must be Sep, Nov or Jan otherwise will be put in unknow catagory.)"
  cohort = $stdin.gets.chomp.to_sym
  if cohort_input_check(cohort) != true
    cohort = :unknown
  end
  while !name.empty? do
    add_to_student_arr(name, cohort)
    student_plural
    puts "Same again. Name:"
    name = $stdin.gets.chomp.to_sym
    puts "Cohort: "
    cohort = $stdin.gets.chomp.to_sym
    if cohort_input_check(cohort) != true
      cohort = :unknown
    end
  end
end

def student_plural
  if @students.count > 1
    puts "Now we have #{@students.count} students"
  else
    puts "Now we have #{@students.count} student"
  end
end

def cohort_input_check(cohort)
  if cohort == :Sep || cohort == :Nov || cohort == :Jan
  return true
  end
end

def print_by_cohorts
  arr = []
  arr = @students.map { |e| e[:cohort] }
  arr.sort.uniq.each { |cohort| print_names(@students.select { |student| student.has_value?(cohort)})}
end

def save_students
  puts "Which file would you like to save to? Hit RETURN for 'students.csv'"
  filename = $stdin.gets.chomp
  if filename.empty?
    filename = 'students.csv'
  end
  #File::open(filename, "w") do |file|
  CSV.open(filename, 'wb') do |csv|
    csv = CSV.new(IO, '<<')
    @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:coding], student[:'175'], student[:Spain]]
    csv_string = CSV.generate_line do |line|
      csv << student_data
    end
    #csv_line = student_data.to_csv
    #csv << csv_line
    end
  end
  puts "Saved #{@students.count} to #{filename}"
end

def load_students
puts "Which filename would you like to load from? Hit RETURN for 'students.csv'"
  filename = $stdin.gets.chomp
  if filename.empty?
    filename = 'students.csv'
  end
  #File::open(filename, "r") do |file|
    CSV.foreach(filename).each do |line|
    name, cohort = line#.chomp.split(",")
    add_to_student_arr(name, cohort)
  end
  #end
  puts "Loaded #{@students.count} from #{filename}"
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry #{filename} doesn't exist."
    exit
  end
end

def add_to_student_arr(name, cohort)
  @students << {name: name, cohort: cohort.to_sym, hobby: :coding, height: :'175', country_of_birth: :Spain}
end

interactive_menu
