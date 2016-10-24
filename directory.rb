students = [{name: "Dr Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohort: :november},
{name: "Alex Delarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Jeoffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}]

def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end

def print_names(names)
  names.each {|student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end

def print_footer(names)
  puts "Overall we have #{names.count} great students."
end

print_header
print_names(students)
print_footer(students)
