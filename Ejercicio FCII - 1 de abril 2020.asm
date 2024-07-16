@ Hecho por Samuel Asanza Mesa y Javier Orbis Ramírez
.global start
.equ N,4
.data
A: .word 8,1,12,5
.bss
B: .space N*4
.text
start:	ldr r0, #0 @i
		ldr r1, #0 @j
		ldr r2, =A
		ldr r3, =B
		ldr r4, #N
		sub r5, r4, #1
while:	
		cmp r0, r5
		bge finW
if:
		push {r0, r1}
		ldr r7, [r2, r0, lsl #2]
		bl es_par
		pop{r0, r1}
		cmp r7, #1
		bne finif
		ldr r6, [r3, r1, lsl#2] @ B[j]
		ldr r7, [r2, r0, lsl#2] @ A[i]
		add r0, r0, #1
		ldr r8, [r2, r0 , lsl#2] @ A[i+1]
		sub r0, r0, #1
		add r6, r7, r8 
		str r6, [r3]
		add r1, r1, #1 @j++		
finif:	
		add r0, r0, #1 @i++
		b while
finW:	
		b .
		.end
es_par:
		@<prólogo>
		push{r5,r6,r9}
		and r5,r7,#1
		mvn r6,r5
		and r9,r6,#1
		@Resto de código
		pop {r5,r6,r9}
		mov pc, lr
		@<epilogo>