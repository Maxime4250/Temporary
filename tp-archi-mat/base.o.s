	.file	"base.c"
	.intel_syntax noprefix
	.text
	.globl	db_init
	.type	db_init, @function
db_init:
.LFB50:
	.cfi_startproc
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rdi
	mov	r12d, esi
	mov	edi, 16
	call	malloc@PLT
	mov	rbp, rax
	mov	DWORD PTR 8[rax], r12d
	lea	edi, 1[r12]
	movsx	rdi, edi
	sal	rdi, 5
	call	malloc@PLT
	mov	QWORD PTR 0[rbp], rax
	test	r12d, r12d
	jle	.L1
	lea	ecx, -1[r12]
	add	rcx, 1
	sal	rcx, 5
	mov	eax, 0
.L3:
	mov	rdx, QWORD PTR 0[rbp]
	movdqu	xmm0, XMMWORD PTR [rbx+rax]
	movups	XMMWORD PTR [rdx+rax], xmm0
	movdqu	xmm1, XMMWORD PTR 16[rbx+rax]
	movups	XMMWORD PTR 16[rdx+rax], xmm1
	add	rax, 32
	cmp	rax, rcx
	jne	.L3
.L1:
	mov	rax, rbp
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE50:
	.size	db_init, .-db_init
	.globl	db_get
	.type	db_get, @function
db_get:
.LFB51:
	.cfi_startproc
	endbr64
	mov	rax, rdi
	sal	rdx, 5
	add	rdx, QWORD PTR [rsi]
	movdqu	xmm0, XMMWORD PTR [rdx]
	movups	XMMWORD PTR [rdi], xmm0
	movdqu	xmm1, XMMWORD PTR 16[rdx]
	movups	XMMWORD PTR 16[rdi], xmm1
	ret
	.cfi_endproc
.LFE51:
	.size	db_get, .-db_get
	.globl	db_count_male
	.type	db_count_male, @function
db_count_male:
.LFB52:
	.cfi_startproc
	endbr64
	mov	rcx, QWORD PTR [rdi]
	mov	edx, DWORD PTR 8[rdi]
	test	edx, edx
	jle	.L11
	lea	rax, 16[rcx]
	lea	edx, -1[rdx]
	sal	rdx, 5
	lea	rsi, 48[rcx+rdx]
	mov	edx, 0
.L10:
	cmp	BYTE PTR [rax], 1
	sete	cl
	movzx	ecx, cl
	add	edx, ecx
	add	rax, 32
	cmp	rax, rsi
	jne	.L10
.L7:
	mov	eax, edx
	ret
.L11:
	mov	edx, 0
	jmp	.L7
	.cfi_endproc
.LFE52:
	.size	db_count_male, .-db_count_male
	.globl	db_free
	.type	db_free, @function
db_free:
.LFB53:
	.cfi_startproc
	endbr64
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdi
	mov	rdi, QWORD PTR [rdi]
	call	free@PLT
	mov	rdi, rbx
	call	free@PLT
	pop	rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE53:
	.size	db_free, .-db_free
	.globl	db_max_age
	.type	db_max_age, @function
db_max_age:
.LFB54:
	.cfi_startproc
	endbr64
	mov	rcx, QWORD PTR [rdi]
	mov	edx, DWORD PTR 8[rdi]
	test	edx, edx
	jle	.L18
	lea	rax, 20[rcx]
	lea	edx, -1[rdx]
	sal	rdx, 5
	lea	rsi, 52[rcx+rdx]
	mov	edx, 0
.L17:
	mov	ecx, DWORD PTR [rax]
	cmp	edx, ecx
	cmovb	edx, ecx
	add	rax, 32
	cmp	rax, rsi
	jne	.L17
.L15:
	mov	eax, edx
	ret
.L18:
	mov	edx, 0
	jmp	.L15
	.cfi_endproc
.LFE54:
	.size	db_max_age, .-db_max_age
	.globl	db_oldest
	.type	db_oldest, @function
db_oldest:
.LFB55:
	.cfi_startproc
	endbr64
	mov	rsi, QWORD PTR [rdi]
	mov	eax, DWORD PTR 8[rdi]
	test	eax, eax
	jle	.L24
	lea	edi, -1[rax]
	mov	eax, 0
	mov	r8, -1
	mov	ecx, 0
	jmp	.L23
.L22:
	lea	rdx, 1[rax]
	cmp	rax, rdi
	je	.L20
	mov	rax, rdx
.L23:
	mov	rdx, rax
	sal	rdx, 5
	mov	edx, DWORD PTR 20[rsi+rdx]
	cmp	edx, ecx
	jb	.L22
	mov	r8, rax
	mov	ecx, edx
	jmp	.L22
.L24:
	mov	r8, -1
.L20:
	mov	rax, r8
	ret
	.cfi_endproc
.LFE55:
	.size	db_oldest, .-db_oldest
	.globl	db_closest
	.type	db_closest, @function
db_closest:
.LFB56:
	.cfi_startproc
	endbr64
	movss	xmm4, DWORD PTR .LC0[rip]
	divss	xmm4, DWORD PTR .LC1[rip]
	mov	esi, DWORD PTR 8[rdi]
	test	esi, esi
	jle	.L31
	mov	rdx, QWORD PTR [rdi]
	add	rdx, 24
	mov	ecx, 0
	mov	eax, -1
.L30:
	movaps	xmm2, xmm0
	subss	xmm2, DWORD PTR [rdx]
	movaps	xmm3, xmm1
	subss	xmm3, DWORD PTR 4[rdx]
	mulss	xmm2, xmm2
	mulss	xmm3, xmm3
	addss	xmm2, xmm3
	comiss	xmm4, xmm2
	cmova	eax, ecx
	minss	xmm2, xmm4
	movaps	xmm4, xmm2
	add	ecx, 1
	add	rdx, 32
	cmp	esi, ecx
	jne	.L30
.L27:
	cdqe
	ret
.L31:
	mov	eax, -1
	jmp	.L27
	.cfi_endproc
.LFE56:
	.size	db_closest, .-db_closest
	.globl	db_count_female_muggles
	.type	db_count_female_muggles, @function
db_count_female_muggles:
.LFB57:
	.cfi_startproc
	endbr64
	mov	edx, DWORD PTR 8[rdi]
	mov	rcx, QWORD PTR [rdi]
	test	edx, edx
	jle	.L38
	lea	rax, 16[rcx]
	lea	edx, -1[rdx]
	sal	rdx, 5
	lea	rsi, 48[rcx+rdx]
	mov	edx, 0
	jmp	.L37
.L36:
	add	rax, 32
	cmp	rax, rsi
	je	.L34
.L37:
	cmp	BYTE PTR [rax], 1
	je	.L36
	cmp	BYTE PTR 1[rax], 0
	setne	cl
	cmp	cl, 1
	adc	edx, 0
	jmp	.L36
.L38:
	mov	edx, 0
.L34:
	mov	eax, edx
	ret
	.cfi_endproc
.LFE57:
	.size	db_count_female_muggles, .-db_count_female_muggles
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1065353216
	.align 4
.LC1:
	.long	0
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
