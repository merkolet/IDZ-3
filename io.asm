.text
.globl read_string, read_char, print_string

read_string:
    li a7, 8
    ecall
    ret

read_char:
    li a7, 12
    ecall
    ret

print_string:
    li a7, 64
    li a0, 1
    ecall
    ret
	