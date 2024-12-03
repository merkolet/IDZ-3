.text
.globl reverse_string             # Declare the reverse_string function as global for external use.

reverse_string:
    mv t1, a0                    # Move the starting address of the string from a0 to t1 (pointer to the beginning of the string).
    add t2, a0, a1               # Calculate the end address of the string by adding the length (a1) to the starting address (a0).
    sb zero, (t2)                # Null-terminate the string by storing a null byte (zero) at the end address.
    addi t2, t2, -1              # Decrement t2 to point to the last valid character (exclude null terminator).

rev_loop:
    bge t1, t2, rev_done         # If the start pointer (t1) is greater than or equal to the end pointer (t2), exit the loop.
    lb t3, 0(t1)                 # Load the character at the current start position into t3.
    lb t4, 0(t2)                 # Load the character at the current end position into t4.
    sb t3, 0(t2)                 # Store the start character (t3) at the end position.
    sb t4, 0(t1)                 # Store the end character (t4) at the start position.
    addi t1, t1, 1               # Move the start pointer (t1) to the next character.
    addi t2, t2, -1              # Move the end pointer (t2) to the previous character.
    j rev_loop                   # Jump back to the start of the loop.

rev_done:
    ret                          # Return from the function.
