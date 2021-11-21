.text
.global getFrequencyCapitalLetter
    # %rdi stores the first argument that is the base address of our string 
    # %rsi stores the second argument that is the base address of our resultant array storing frequencies

getFrequencyCapitalLetter:
movq $0, %rdx # i i.e. the iterator that traverses through the string


.checkInit:
cmpq $25, %rdx
jg .start # %rdx >25

.init:
leaq (%rsi, %rdx, 2), %r11 # %r11 stores the address of f[%rdx]
movq $0, (%r11) 
inc %rdx
jmp .checkInit


.start:
movq $0, %rdx # i i.e. the iterator that traverses through the string
.check:
cmpq $31, %rdx # %rdx - 31
jg .done # %rdx > 31

.calculateFrequency:
leaq (%rdi, %rdx, 1), %r8 # %r8 = Address (in memory) of the considering character in the string
movzbq (%r8), %r9 # %r9 has the ascii value of the character
subq $65, %r9 # Ascii value of the character - 65 = %r9

cmpq $25, %r9 # 25 - %r9
jg .next # 25 < %r9

cmpq $0, %r9 # %r9 - 0
jl .next # %r9 < 0

# Update the frequency array
leaq (%rsi, %r9, 2), %r10 # Address in memory the value at which needs to be incremented
movq (%r10), %rax
inc %rax
movq %rax, (%r10)

.next:
inc %rdx
jmp .check

.done:



