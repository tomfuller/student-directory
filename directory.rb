students = ["Dr Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex Delarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Jeoffrey Baratheon",
"Norman Bates"]

def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end

def print_names(names)
  names.each {|student| puts student}
end

def print_footer(names)
  puts "Overall we have #{names.count} great students."
end

print_header
print_names(students)
print_footer(students)
