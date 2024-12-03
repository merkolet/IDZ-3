.macro open_file (%filename, %mode, %result)
    la a0, %filename           # Load the address of the filename into a0.
    li a1, %mode               # Load the file mode (read/write) into a1.
    li a7, 1024                # Set syscall number for open (sys_open).
    ecall                      # Perform the system call.
    
    mv %result, a0             # Move the file descriptor returned by the system call to %result.
.end_macro

.macro read_file (%fd, %buffer, %size, %result)
    li a7, 63                  # Set syscall number for read (sys_read).
    mv a0, %fd                 # Move file descriptor into a0.
    la a1, %buffer             # Load the address of the buffer into a1.
    li a2, %size               # Load the size of the buffer into a2.
    addi a2, a2, -1            # Adjust size to account for null-termination.
    ecall                      # Perform the system call.
    
    mv %result, a0             # Move the number of bytes read into %result.
.end_macro

.macro write_file (%fd, %buffer, %size)
    mv a0, %fd                 # Move file descriptor into a0.
    la a1, %buffer             # Load the address of the buffer into a1.
    mv a2, %size               # Move the size of the data to write into a2.
    li a7, 64                  # Set syscall number for write (sys_write).
    ecall                      # Perform the system call.
.end_macro

.macro close_file (%fd)
    mv a0, %fd                 # Move file descriptor into a0.
    li a7, 57                  # Set syscall number for close (sys_close).
    ecall                      # Perform the system call.
.end_macro

.macro reverse_string (%buffer)
    mv a1, a0                  # Save the current value of a0 into a1.
    la a0, %buffer             # Load the address of the buffer into a0 (argument for reverse_string).
    jal reverse_string         # Jump and link to the reverse_string function.
.end_macro

.macro print_test (%test)
    la a0, %test               # Load the address of the test message into a0.
    li a7, 4                   # Set syscall number for print (sys_write).
    ecall                      # Perform the system call to print the message.
.end_macro

.macro read_char
loop:
    li a7, 12                  # Set syscall number for reading a character (sys_read).
    ecall                      # Perform the system call.
    
    lb t5, yes_char            # Load the 'Y' character into t5.
    lb t6, no_char             # Load the 'N' character into t6.
    
    beq a0, t5, print          # If input is 'Y', jump to print label.
    beq a0, t6, no_print       # If input is 'N', jump to no_print label.
    
    la a0, promt               # Load the prompt message into a0.
    li a7, 4                   # Set syscall number for print (sys_write).
    ecall                      # Print the prompt message.
    
    la a0, promt_char_error    # Load the error message into a0.
    li a7, 4                   # Set syscall number for print (sys_write).
    ecall                      # Print the error message.
    
    j loop                     # Repeat the loop for another input attempt.
    
print:
    jal print_to_console       # Call the print_to_console function.
no_print:
.end_macro
