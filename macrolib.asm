.macro open_file (%filename, %mode, %result)
    la a0, %filename
    li a1, %mode
    li a7, 1024
    ecall
    
    mv %result, a0
.end_macro

.macro read_file (%fd, %buffer, %size, %result)
	li a7, 63
    mv a0, %fd
    la a1, %buffer
    li a2, %size
    ecall
    
    mv %result, a0
.end_macro

.macro write_file (%fd, %buffer, %size)
    mv a0, %fd
    la a1, %buffer
    mv a2, %size
    li a7, 64
    ecall
.end_macro

.macro close_file (%fd)
    mv a0, %fd
    li a7, 57
    ecall
.end_macro

.macro reverse_string (%buffer)
	mv a1, a0
	la a0, %buffer
    jal reverse_string
.end_macro

.macro print_test (%test)
	la a0, %test
	li a7, 4
	ecall
.end_macro

.macro print (%size_text)
	li a7, 4
	lw a3, 4
	sw a3, a4, a5
	la a0, tezt_buffer
	ecall
.end_macro
