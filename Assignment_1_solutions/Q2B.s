/* Given list L of " 32 signed Integers " each of " 16 bits " and a key X (16 bit).
Find the location of X within L, return -1 if X does not belong to L.
The list L is stored in memory inside the data section.
You have to use Binary Search to look for X within L.
Report the number of iterations taken to successfully/unsuccessfully find X.*/

.data
a: .word -10, -9, -8, -7, -6 , -5, -4, -3, -2, -1, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 12, 13, 13, 13, 14, 14, 14, 14, 15,19  
key: .word -2
# pos: .quad -1 
# iter: .quad 0

.text
.global main
main:

movq a@GOTPCREL(%rip), %r9 # %r9 stores the base address of array a
movq key@GOTPCREL(%rip), %r10 
movw (%r10), %r10w # %r10w = key

# movq pos@GOTPCREL(%rip), %r11
# movq iter@GOTPCREL(%rip), %r12

movq $0, %r13 # %r13 = number of iterations
movq $0, %rdi # %rdi = l 
movq $31, %rsi  # %rsi = r

.check:
cmpq %rdi, %rsi
jl .done # %rsi < %rdi i.e. r < l
# l <= r

.loop:
inc %r13
movq %rdi, %rax
addq %rsi, %rax # %rax = l + r
shrq $1, %rax
# %rax = l+r/2
movw (%r9, %rax, 2), %r8w   # %r8w = a[m]
cmpw %r8w, %r10w # key - a[m]
je .found
jg .greater # key > a[m] //Ignore the first half l = m + 1
jl .lesser # key < a[m] // Ignore the second half r = m-1

.greater:
movq %rax, %rcx
addq $1, %rcx # %rcx = m + 1
movq %rcx, %rdi # l = m + 1
jmp .check

.lesser:
movq %rax, %rcx
subq $1, %rcx # m-1
movq %rcx, %rsi # r = m-1
jmp .check

.found:
# movq %rax, (%r11)
movq %rax, %r11

.done:
# movq %r13, (%r12)
movq %r13, %r12
