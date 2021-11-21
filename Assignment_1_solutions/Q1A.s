/* Given a list L of "32 signed Integers" each of "16 bits", sort them using Bubble Sort. The 32
integers will be stored in a data section of your code i.e store these integers in memory not in
registers. You need to report the sorted list of integers. */

.data
a: .word 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1 

.text
.global main
main:
# Initialisations
movq a@GOTPCREL(%rip), %r9 # %r9 stores the base address of array a
movq $0, %rdx # Iterator i
movq $0, %rcx # Iterator j

.loop:
leaq (%r9, %rcx, 2), %rsi # %rsi stores the address of a[j]
movw (%rsi), %r11w # r11w stores the value of a[j]
movq %rcx, %rax # %ax stores value of j
inc %rax 
leaq (%r9, %rax, 2), %rdi # %rdi stores the address of a[j+1]
movw (%rdi), %r10w # r10w stores the value of a[j+1]
cmpw %r11w, %r10w
jg .checkJ # %r10w > %r11w i.e. a[j+1] > a[j]

.swap:
# Swap a[j], a[j+1] in memory
movw %r10w, (%rsi)
movw %r11w, (%rdi)
jmp .checkJ

.checkI:
inc %rdx
cmpq $30, %rdx # %rdx - 30
jg .done # i > 30
movq $0, %rcx # Reinitialise j to 0
jmp .loop

.checkJ:
inc %rcx
movq $30, %r10 # %r10 = 30
subq %rdx, %r10 # %r10 = %r10 - %rdx i.e %r10 = 30 - i
cmpq %r10, %rcx # Compare j with 30 - i 
jg .checkI # j > 30 - i 
jmp .loop

.done:
