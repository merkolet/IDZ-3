.text
.globl read_string, read_char, print_string, process_file

read_char:
    li a7, 12
    ecall
    ret

print_string:
    li a7, 64
    li a0, 1
    ecall
    ret
    
process_file:
    read_file (s4, text_buffer, text_size, t0) 	# Чтение данных из файла
    beqz t0, end_process                       	# Если конец файла, выход
	
    reverse_string (text_buffer)       			# Переворот строки

    j process_file