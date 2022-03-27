	.file	"arrays.c"
	.intel_syntax noprefix
	.text
	.globl	malloc_aligned
	.type	malloc_aligned, @function
malloc_aligned:
.LFB50:
	.cfi_startproc
	endbr64
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	and	rdi, -32
	lea	rsi, 32[rdi]
	mov	edi, 32
	call	aligned_alloc@PLT
	add	rsp, 8
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE50:
	.size	malloc_aligned, .-malloc_aligned
	.globl	db_init
	.type	db_init, @function
db_init:
.LFB51:
	.cfi_startproc
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 8
	.cfi_def_cfa_offset 64
	mov	r15, rdi
	mov	ebp, esi
	mov	edi, 64
	call	malloc@PLT
	mov	rbx, rax
	movsx	r13, ebp
	lea	r14, 0[0+r13*8]
	mov	rdi, r14
	call	malloc_aligned
	mov	QWORD PTR [rbx], rax
	mov	rdi, r14
	call	malloc_aligned
	mov	QWORD PTR 8[rbx], rax
	lea	r12, 0[0+r13*4]
	mov	rdi, r12
	call	malloc_aligned
	mov	QWORD PTR 16[rbx], rax
	mov	rdi, r14
	call	malloc_aligned
	mov	QWORD PTR 24[rbx], rax
	mov	rdi, r13
	call	malloc_aligned
	mov	QWORD PTR 32[rbx], rax
	mov	rdi, r12
	call	malloc_aligned
	mov	QWORD PTR 40[rbx], rax
	mov	rdi, r12
	call	malloc_aligned
	mov	QWORD PTR 48[rbx], rax
	mov	DWORD PTR 56[rbx], ebp
	test	ebp, ebp
	jle	.L3
	mov	rdi, r15
	lea	r9d, -1[rbp]
	mov	eax, 0
	mov	r10d, 1
	jmp	.L7
.L5:
	lea	edx, 63[rax]
	test	eax, eax
	cmovns	edx, eax
	sar	edx, 6
	movsx	rdx, edx
	add	rdx, QWORD PTR 24[rbx]
	mov	r11d, eax
	sar	r11d, 31
	shr	r11d, 26
	lea	ecx, [r11+rax]
	and	ecx, 63
	sub	ecx, r11d
	mov	r15, r10
	sal	r15, cl
	mov	rcx, r15
	not	ecx
	and	BYTE PTR [rdx], cl
.L6:
	movzx	ecx, BYTE PTR 17[rsi]
	mov	rdx, QWORD PTR 32[rbx]
	mov	BYTE PTR [rdx+rax], cl
	movss	xmm0, DWORD PTR 24[rsi]
	mov	rdx, QWORD PTR 40[rbx]
	movss	DWORD PTR [rdx+r8], xmm0
	movss	xmm0, DWORD PTR 28[rsi]
	mov	rdx, QWORD PTR 48[rbx]
	movss	DWORD PTR [rdx+r8], xmm0
	lea	rdx, 1[rax]
	add	rdi, 32
	cmp	rax, r9
	je	.L3
	mov	rax, rdx
.L7:
	mov	rsi, rdi
	mov	rcx, QWORD PTR [rdi]
	mov	rdx, QWORD PTR [rbx]
	mov	QWORD PTR [rdx+rax*8], rcx
	mov	rcx, QWORD PTR 8[rdi]
	mov	rdx, QWORD PTR 8[rbx]
	mov	QWORD PTR [rdx+rax*8], rcx
	lea	r8, 0[0+rax*4]
	mov	ecx, DWORD PTR 20[rdi]
	mov	rdx, QWORD PTR 16[rbx]
	mov	DWORD PTR [rdx+rax*4], ecx
	cmp	BYTE PTR 16[rdi], 1
	jne	.L5
	lea	edx, 63[rax]
	test	eax, eax
	cmovns	edx, eax
	sar	edx, 6
	movsx	rdx, edx
	add	rdx, QWORD PTR 24[rbx]
	mov	r11d, eax
	sar	r11d, 31
	shr	r11d, 26
	lea	ecx, [r11+rax]
	and	ecx, 63
	sub	ecx, r11d
	mov	r14, r10
	sal	r14, cl
	or	BYTE PTR [rdx], r14b
	jmp	.L6
.L3:
	mov	rax, rbx
	add	rsp, 8
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE51:
	.size	db_init, .-db_init
	.globl	db_free
	.type	db_free, @function
db_free:
.LFB52:
	.cfi_startproc
	endbr64
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdi
	mov	rdi, QWORD PTR [rdi]
	call	free@PLT
	mov	rdi, QWORD PTR 8[rbx]
	call	free@PLT
	mov	rdi, QWORD PTR 16[rbx]
	call	free@PLT
	mov	rdi, QWORD PTR 24[rbx]
	call	free@PLT
	mov	rdi, QWORD PTR 32[rbx]
	call	free@PLT
	mov	rdi, QWORD PTR 40[rbx]
	call	free@PLT
	mov	rdi, QWORD PTR 48[rbx]
	call	free@PLT
	mov	rdi, rbx
	call	free@PLT
	pop	rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE52:
	.size	db_free, .-db_free
	.globl	db_get
	.type	db_get, @function
db_get:
.LFB53:
	.cfi_startproc
	endbr64
	mov	rax, rdi
	mov	rcx, QWORD PTR 8[rsi]
	mov	r9, QWORD PTR [rcx+rdx*8]
	mov	rcx, QWORD PTR 24[rsi]
	movzx	r8d, BYTE PTR [rcx+rdx]
	mov	rcx, QWORD PTR 32[rsi]
	movzx	edi, BYTE PTR [rcx+rdx]
	mov	rcx, QWORD PTR 16[rsi]
	mov	ecx, DWORD PTR [rcx+rdx*4]
	mov	r10, QWORD PTR 40[rsi]
	movss	xmm1, DWORD PTR [r10+rdx*4]
	mov	r10, QWORD PTR 48[rsi]
	movss	xmm0, DWORD PTR [r10+rdx*4]
	mov	rsi, QWORD PTR [rsi]
	mov	rdx, QWORD PTR [rsi+rdx*8]
	mov	QWORD PTR [rax], rdx
	mov	QWORD PTR 8[rax], r9
	mov	BYTE PTR 16[rax], r8b
	mov	BYTE PTR 17[rax], dil
	mov	DWORD PTR 20[rax], ecx
	movss	DWORD PTR 24[rax], xmm1
	movss	DWORD PTR 28[rax], xmm0
	ret
	.cfi_endproc
.LFE53:
	.size	db_get, .-db_get
	.globl	db_count_male
	.type	db_count_male, @function
db_count_male:
.LFB54:
	.cfi_startproc
	endbr64
	mov	eax, DWORD PTR 56[rdi]
	test	eax, eax
	jle	.L16
	mov	rdx, QWORD PTR 24[rdi]
	sub	eax, 1
	shr	eax, 2
	mov	eax, eax
	lea	rdi, 4[rdx+rax*4]
	mov	ecx, 0
.L15:
	movsx	eax, BYTE PTR [rdx]
	movsx	esi, BYTE PTR 1[rdx]
	add	eax, esi
	movsx	esi, BYTE PTR 2[rdx]
	add	eax, esi
	movsx	esi, BYTE PTR 3[rdx]
	add	eax, esi
	add	ecx, eax
	add	rdx, 4
	cmp	rdx, rdi
	jne	.L15
.L13:
	mov	eax, ecx
	ret
.L16:
	mov	ecx, 0
	jmp	.L13
	.cfi_endproc
.LFE54:
	.size	db_count_male, .-db_count_male
	.globl	db_max_age
	.type	db_max_age, @function
db_max_age:
.LFB55:
	.cfi_startproc
	endbr64
	mov	eax, 0
	ret
	.cfi_endproc
.LFE55:
	.size	db_max_age, .-db_max_age
	.globl	db_oldest
	.type	db_oldest, @function
db_oldest:
.LFB56:
	.cfi_startproc
	endbr64
	mov	rax, -1
	ret
	.cfi_endproc
.LFE56:
	.size	db_oldest, .-db_oldest
	.globl	db_closest
	.type	db_closest, @function
db_closest:
.LFB57:
	.cfi_startproc
	endbr64
	mov	rax, -1
	ret
	.cfi_endproc
.LFE57:
	.size	db_closest, .-db_closest
	.globl	db_count_female_muggles
	.type	db_count_female_muggles, @function
db_count_female_muggles:
.LFB58:
	.cfi_startproc
	endbr64
	mov	eax, 0
	ret
	.cfi_endproc
.LFE58:
	.size	db_count_female_muggles, .-db_count_female_muggles
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
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
