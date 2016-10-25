@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
      puts "#{t + 1}. #{names[t][:name]} (#{names[t][:cohort]} cohort).".center(50)
      puts "They like #{names[t][:hobby]}".center(50)
      puts "They're #{names[t][:height]}cm tall".center(50)
      puts "They were born in #{names[t][:country_of_birth]}.".center(50)
      t += 1
    end
  end
end

def print_footer
  puts "Overall we have #{@students.count} great students.".center(50)
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice."
  #@students = []
  name = gets.gsub(/\n/, "").to_sym
  puts "Please enter their Cohort (Note: Must be Sep, Nov or Jan otherwise will be put in unknow catagory.)"
  cohort = gets.chomp.to_sym
  if cohort == :Sep || cohort == :Nov || cohort == :Jan
  else
    cohort = :unknown
  end
  while !name.empty? do
    @students << {name: name, cohort: cohort, hobby: :coding, height: :'175', country_of_birth: :Spain}

    if @students.count > 1
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have #{@students.count} student"
    end
    puts "Same again. Name:"
    name = gets.chomp.to_sym
    puts "Cohort: "
    cohort = gets.chomp.to_sym
    if cohort == :Sep || cohort == :Nov || cohort == :Jan
    else
      cohort = :unknown
    end
  end
end


def print_by_cohorts
  arr = []
  arr = @students.map { |e| e[:cohort] }
  arr.sort.uniq.each { |cohort| print_names(@students.select { |student| student.has_value?(cohort)})}
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

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

interactive_menu
