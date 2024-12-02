.text
.globl reverse_string

reverse_string:
    mv t1, a0                  # Указатель на начало строки
    add t2, a0, a1             # Указатель на конец строки (a1 — длина строки)
    addi t2, t2, -1            # Сдвиг на последний символ

rev_loop:
    bge t1, t2, rev_done       # Условие выхода из цикла
    lb t3, 0(t1)
    lb t4, 0(t2)
    sb t3, 0(t2)
    sb t4, 0(t1)
    addi t1, t1, 1
    addi t2, t2, -1
    j rev_loop

rev_done:
    ret
