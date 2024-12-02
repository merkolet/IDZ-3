.include "macrolib.asm"

.eqv    text_size 512

.data
input_file_1:  .asciz "input1.txt"
input_file_2:  .asciz "input2.txt"
input_file_3:  .asciz "input3.txt"
input_file_4:  .asciz "input4.txt"
input_file_5:  .asciz "input5.txt"

output_file_1: .asciz "output1.txt"
output_file_2: .asciz "output2.txt"
output_file_3: .asciz "output3.txt"
output_file_4: .asciz "output4.txt"
output_file_5: .asciz "output5.txt"

test1: 		   .asciz "--------Тест 1------------"
test2: 		   .asciz "--------Тест 2------------"
test3: 		   .asciz "--------Тест 3------------"
test4: 		   .asciz "--------Тест 4------------"
test5: 		   .asciz "--------Тест 5------------"

yes_char:     .byte  'Y', 0
text_buffer:  .space text_size

.text
.globl main

main:
	print_test (test1)
    open_file (input_file_1, 0, s4)		# Открытие входного файла (только чтение).
    j process_file						# Считывание данных с файла и переворот строки.
    open_file (output_file_1, 577, s5)  # Открытие выходного файла.
    write_file(s5, text_buffer, text_size) # Запись в файл.
    

end_process:
    close_file (s4)                      # Закрытие входного файла
    close_file (s5)						 # Закрытие выходного файла
    
exit:            				
    li a7, 10                            # Завершение программы
    ecall
