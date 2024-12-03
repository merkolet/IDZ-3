.include "macrolib.asm"                # Include the macro library.

.eqv    text_size 512                  # Define the buffer size (512 bytes).

.text
.globl process_file, print_to_console   # Declare global functions for external access.
   
process_file:
    addi sp, sp, -4                    # Allocate space on the stack for saving the return address.
    sw ra, (sp)                        # Save the return address to the stack.
	
process_file_start:
    read_file (s4, text_buffer, text_size, t0)  # Read data from the input file into the buffer.
    blez t0, end_process                        # If no data is read (end of file), jump to cleanup.

    sw t0, buffer_size, t1                      # Store the size of the data read in the buffer_size variable.
    reverse_string (text_buffer)                # Call the subroutine to reverse the string in place.
    
    j process_file_start                        # Continue reading and processing the file.

end_process:
    lw ra, (sp)                        # Restore the return address from the stack.
    addi sp, sp, 4                     # Deallocate space on the stack.

    close_file (s4)                    # Close the input file.
    ret                                # Return to the caller.
    
print_to_console:
    print_test (promt)                 # Print a newline.
    print_test (promt_string)          # Print the prompt indicating a reversed string.
    print_test (text_buffer)           # Print the reversed string from the buffer.
    ret                                # Return to the caller.
