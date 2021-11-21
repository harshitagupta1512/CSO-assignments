# Given a Matrix M with 16 bit values in memory. M has 8 rows and 8 columns. Rotate the
# matrix by 90 degrees in the anticlockwise direction without using any extra memory.
.text
.global rotateAnticlockwise
rotateAnticlockwise:
    # %rdi stores the first argument that is the base address of our matrix 
# Replace M by its transpose

movq $0, %rcx # i iterator [0-8)
movq $0, %rdx # j iterator [i-8)

.loop:
# swap a[i][j] and a[j][i]
cmpq %rdx, %rcx
je .checkJ1
# i != j
# Swap Function
# &a[i][j] = &a[0][0] + i*2*8 + j*2
movq %rcx, %r8 # %r8 = i
imulq $2, %r8 # %r8 = 2i
leaq (%rdi, %r8, 8), %r10 
leaq (%r10, %rdx, 2), %r10

movq %rdx, %r8 # %r8 = j
imulq $2, %r8 # 2j
leaq (%rdi, %r8, 8), %r11
leaq (%r11, %rcx, 2), %r11

movq $0, %r12
movq $0, %r13

movw (%r10),  %r12w
movw (%r11) , %r13w
movw %r13w, (%r10)
movw %r12w, (%r11)

jmp .checkJ1

.checkI1:
inc %rcx
movq %rcx, %rdx # j = i
cmpq $7, %rcx
jg .doneTranspose # i > 7
jmp .loop

.checkJ1:
inc %rdx # j++
cmpq $7, %rdx
jg .checkI1 # j > 7
jmp .loop

.doneTranspose:

# M = M Transpose

# Step 2 - Reversing the Columns
# for (int i = 0; i < 7; i++) for (int j = 0, k = 7; j < k; j++, k--) swap(arr[j][i], arr[k][i]);

# Initialistaions
movq $0, %rcx # i
movq $0, %rdx # j
movq $7, %rax # k

.loop2:
# swap a[k][i] and a[j][i]
cmpq %rdx, %rax # if(j == k)
je .checkJK
# k != j
# Swap Function

movq %rax, %r8 # %r8 = k
imulq $2, %r8 # %r8 = 2k
leaq (%rdi, %r8, 8), %r10 
leaq (%r10, %rcx, 2), %r10

movq %rdx, %r8 # %r8 = j
imulq $2, %r8 # 2j
leaq (%rdi, %r8, 8), %r11
leaq (%r11, %rcx, 2), %r11

movq $0, %r12
movq $0, %r13

movw (%r10),  %r12w
movw (%r11) , %r13w
movw %r13w, (%r10)
movw %r12w, (%r11)

jmp .checkJK

.checkI2:
inc %rcx
movq $0, %rdx # Reinitialise j to 0 and k to 7
movq $7, %rax
cmpq $7, %rcx
jg .doneReverse # i > 7
jmp .loop2

.checkJK:
inc %rdx # j++
dec %rax # k--
cmpq %rax, %rdx
jge .checkI2 # j >= k
jmp .loop2

.doneReverse:


