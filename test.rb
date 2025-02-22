def caesar_cipher(string, shift)
  shift = shift % 26  # Ensure shift remains within the alphabet range

  encrypted_text = string.chars.map do |char|  
    if char.match?(/[A-Za-z]/)  
      base = char.ord < 91 ? 'A'.ord : 'a'.ord  
      ((char.ord - base + shift) % 26 + base).chr
    else
      char  
    end
  end.join  # Join array back into a string

  encrypted_text  # Return the encrypted text
end

# Get user input
puts "Enter the message you want to encrypt:"
input_string = gets.chomp

puts "Enter the shift number (positive for encrypt, negative for decrypt):"
shift_number = gets.chomp.to_i  # Convert input to integer

# Encrypt the message
encrypted_word = caesar_cipher(input_string, shift_number)

# Display the result
puts "The encrypted message: #{encrypted_word}"