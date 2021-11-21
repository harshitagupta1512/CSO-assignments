.text
.global getHammingDistance
    # %rdi stores the first argument that is a
    # %rsi stores the second argument that is b
    #  Hamming Distance between two integers is the number of bits that are different at the same position in both numbers

getHammingDistance:

movq $0, %rcx
movq $0, %r8

movzwq %di, %rcx # %rcx = a
movzwq %si, %r8 # %r8 = b

xorq %r8, %rcx # %rcx = a XOR b

# To find the number of "1"s in %rcx

movq $0, %r9 # Hamming Distance 

.check:
cmpq $0, %rcx
jle .done # %rcx <=0

.loop:
movq $0, %rdx
movq %rcx, %rax
movq $2, %r10
idivq %r10
# %rdx = remainder
movq %rax, %rcx # %rcx = %rcx / 2
cmpq $1, %rdx
je .count
jmp .check

.count:
inc %r9
jmp .check

.done:
movq %r9, %rax
ret
