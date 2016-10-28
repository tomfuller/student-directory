counter = 1
File::open($PROGRAM_NAME, "r") do |file|
  while (line = file.gets)
    puts "#{counter}: #{line}"
    counter += 1
  end
end
