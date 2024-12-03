.include "macrolib.asm"

.eqv    text_size 512                 # Define text buffer size (512 bytes).

.data
promt:         .asciz "\n"            # Newline prompt.
promt_string:  .asciz "Reversed string: " # Message for reversed string.

# Input file names.
input_file_1:  .asciz "input1.txt"
input_file_2:  .asciz "input2.txt"
input_file_3:  .asciz "input3.txt"
input_file_4:  .asciz "input4.txt"
input_file_5:  .asciz "input5.txt"

# Output file names.
output_file_1: .asciz "output1.txt"
output_file_2: .asciz "output2.txt"
output_file_3: .asciz "output3.txt"
output_file_4: .asciz "output4.txt"
output_file_5: .asciz "output5.txt"

# Test descriptions.
test1:         .asciz "----------------------------------Test 1----------------------------------"
test2:         .asciz "----------------------------------Test 2----------------------------------"
test3:         .asciz "----------------------------------Test 3----------------------------------"
test4:         .asciz "----------------------------------Test 4----------------------------------"
test5:         .asciz "----------------------------------Test 5----------------------------------"

# Prompts for test completion.
promt1:        .asciz "Data from input1.txt read and reversed string saved to output1.txt."
promt2:        .asciz "Data from input2.txt read and reversed string saved to output2.txt."
promt3:        .asciz "Data from input3.txt read and reversed string saved to output3.txt."
promt4:        .asciz "Data from input4.txt read and reversed string saved to output4.txt."
promt5:        .asciz "Data from input5.txt read and reversed string saved to output5.txt."

# Console prompts.
promt_char:     .asciz "Display data to console? (Y/N): "
promt_char_error: .asciz "Invalid input, please try again (Y/N): "

yes_char:     .byte  'Y'             # 'Y' for console output confirmation.
no_char:      .byte  'N'             # 'N' for skipping console output.
text_buffer:  .space text_size       # Allocate space for the text buffer (512 bytes).
buffer_size:  .word 0                # Word to store the size of the data read.

.text
.globl main, text_buffer, buffer_size, yes_char, promt, promt_string, promt_char_error

main:
	# ----------Test 1---------------
	print_test (test1)                  # Print test header.
	print_test (promt)                  # Print newline.
    open_file (input_file_1, 0, s4)     # Open input file (read-only).
    jal process_file                    # Call subroutine to read and reverse the string.
    open_file(output_file_1, 1, s5)     # Open output file (write mode).
    lw t0, buffer_size                  # Load buffer size.
    write_file(s5, text_buffer, t0)     # Write reversed string to output file.
    close_file (s5)                     # Close output file.
    
   	print_test (promt1)                 # Print success message.
   	print_test (promt)                  # Print newline.
   	print_test (promt_char)             # Ask if output should be displayed.
   	read_char                           # Read user input (Y/N).
   	
   	# ----------Test 2---------------
   	print_test (promt)                  # Print newline.
	print_test (test2)                  # Print test header.
	print_test (promt)                  # Print newline.
    open_file (input_file_2, 0, s4)     # Open input file (read-only).
    jal process_file                    # Call subroutine to read and reverse the string.
    open_file(output_file_2, 1, s5)     # Open output file (write mode).
    lw t0, buffer_size                  # Load buffer size.
    write_file(s5, text_buffer, t0)     # Write reversed string to output file.
    close_file (s5)                     # Close output file.
    
   	print_test (promt2)                 # Print success message.
   	print_test (promt)                  # Print newline.
   	print_test (promt_char)             # Ask if output should be displayed.
   	read_char                           # Read user input (Y/N).
   	
   	# ----------Test 3---------------
   	print_test (promt)                  # Print newline.
	print_test (test3)                  # Print test header.
	print_test (promt)                  # Print newline.
    open_file (input_file_3, 0, s4)     # Open input file (read-only).
    jal process_file                    # Call subroutine to read and reverse the string.
    open_file(output_file_3, 1, s5)     # Open output file (write mode).
    lw t0, buffer_size                  # Load buffer size.
    write_file(s5, text_buffer, t0)     # Write reversed string to output file.
    close_file (s5)                     # Close output file.
    
   	print_test (promt3)                 # Print success message.
   	print_test (promt)                  # Print newline.
   	print_test (promt_char)             # Ask if output should be displayed.
   	read_char                           # Read user input (Y/N).
   	
   	# ------------Test 4-------------
   	print_test (promt)                  # Print newline.
	print_test (test4)                  # Print test header.
	print_test (promt)                  # Print newline.
    open_file (input_file_4, 0, s4)     # Open input file (read-only).
    jal process_file                    # Call subroutine to read and reverse the string.
    open_file(output_file_4, 1, s5)     # Open output file (write mode).
    lw t0, buffer_size                  # Load buffer size.
    write_file(s5, text_buffer, t0)     # Write reversed string to output file.
    close_file (s5)                     # Close output file.
    
   	print_test (promt4)                 # Print success message.
   	print_test (promt)                  # Print newline.
   	print_test (promt_char)             # Ask if output should be displayed.
   	read_char                           # Read user input (Y/N).
   	
   	# -----------Test 5---------------
   	print_test (promt)                  # Print newline.
	print_test (test5)                  # Print test header.
	print_test (promt)                  # Print newline.
    open_file (input_file_5, 0, s4)     # Open input file (read-only).
    jal process_file                    # Call subroutine to read and reverse the string.
    open_file(output_file_5, 1, s5)     # Open output file (write mode).
    lw t0, buffer_size                  # Load buffer size.
    write_file(s5, text_buffer, t0)     # Write reversed string to output file.
    close_file (s5)                     # Close output file.
    
   	print_test (promt5)                 # Print success message.
   	print_test (promt)                  # Print newline.
   	print_test (promt_char)             # Ask if output should be displayed.
   	read_char                           # Read user input (Y/N).
    
exit:            				
    li a7, 10                            # Exit program.
    ecall
