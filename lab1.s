.text
.global _start
.org 0 
_start:

	# X = W-A
	ldw  r2, W(r0)
  	ldw  r3, A(r0)
  	sub  r2, r2, r3
  	stw  r2, X(r0)

	# C = (X+1)*F
	ldw  r6, X(r0)
    addi r2, r6, 1
	ldw  r5, F(r0)
	mul  r2, r2, r5
	stw  r2, C(r0)

	# J = (C+F)/A
	ldw  r2, C(r0)
	add  r2, r2, r5
	div  r2, r2, r3
	stw  r2, J(r0)
	break
	
	.org 0x1000

# constants 
A:	.word 2
F:	.word 3
K:	.word 4
T:	.word 5
W:	.word 6

# results
X:	.skip 4
C:	.skip 4
J:	.skip 4
  	.end

