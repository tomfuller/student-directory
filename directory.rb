def interactive_menu
  students = []
  loop do
    # 1. Print the menu and ask user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. Read the input and save it to a variable
    selection = gets.chomp
    # 3. What the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print_by_cohorts(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant. Try again."
    end

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

def print_footer(names)
  puts "Overall we have #{names.count} great students.".center(50)
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice."

  students = []

  name = gets.gsub(/\n/, "").to_sym
  puts "Please enter their Cohort (Note: Must be Sep, Nov or Jan otherwise will be put in unknow catagory.)"
  cohort = gets.chomp.to_sym
  if cohort == :Sep || cohort == :Nov || cohort == :Jan
  else
    cohort = :unknown
  end


  while !name.empty? do
    students << {name: name, cohort: cohort, hobby: :coding, height: :'175', country_of_birth: :Spain}

    if students.count > 1
      puts "Now we have #{students.count} students"
    else
      puts "Now we have #{students.count} student"
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
  students
end

def print_by_cohorts(students)
  arr = []
  arr = students.map { |e| e[:cohort] }
  arr.sort.uniq.each { |cohort| print_names(students.select { |student| student.has_value?(cohort)})}
end

interactive_menu
#print_header
#print_by_cohorts(students)
#print_footer(students)
