	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	FLA_Clock
	.type	FLA_Clock, @function
FLA_Clock:
.LFB50:
	.cfi_startproc
	endbr64
	sub	rsp, 40
	.cfi_def_cfa_offset 48
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 24[rsp], rax
	xor	eax, eax
	mov	rsi, rsp
	mov	edi, 1
	call	clock_gettime@PLT
	pxor	xmm0, xmm0
	ucomisd	xmm0, QWORD PTR gtod_ref_time_sec[rip]
	jp	.L2
	jne	.L2
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, QWORD PTR [rsp]
	movsd	QWORD PTR gtod_ref_time_sec[rip], xmm0
.L2:
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, QWORD PTR [rsp]
	subsd	xmm0, QWORD PTR gtod_ref_time_sec[rip]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, QWORD PTR 8[rsp]
	mulsd	xmm1, QWORD PTR .LC1[rip]
	addsd	xmm0, xmm1
	mov	rax, QWORD PTR 24[rsp]
	xor	rax, QWORD PTR fs:40
	jne	.L7
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE50:
	.size	FLA_Clock, .-FLA_Clock
	.globl	generate_random_persons
	.type	generate_random_persons, @function
generate_random_persons:
.LFB51:
	.cfi_startproc
	endbr64
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 8
	.cfi_def_cfa_offset 48
	mov	ebp, edi
	movsx	rdi, edi
	sal	rdi, 5
	call	malloc@PLT
	mov	r12, rax
	mov	edi, 0
	call	srand@PLT
	lea	rbx, rands[rip]
	lea	r13, 536870912[rbx]
.L9:
	call	rand@PLT
	mov	DWORD PTR [rbx], eax
	add	rbx, 4
	cmp	rbx, r13
	jne	.L9
	test	ebp, ebp
	jle	.L8
	mov	rcx, r12
	mov	edi, 0
	lea	r10, rands[rip]
	lea	r9, first_names[rip]
	lea	r8, last_names[rip]
.L11:
	mov	edx, edi
	sar	edx, 31
	shr	edx, 5
	lea	eax, [rdi+rdx]
	and	eax, 134217727
	sub	eax, edx
	cdqe
	mov	edx, DWORD PTR [r10+rax*4]
	mov	esi, edx
	sar	esi, 31
	mov	r11d, esi
	shr	r11d, 30
	lea	eax, [rdx+r11]
	and	eax, 3
	sub	eax, r11d
	cdqe
	sal	rax, 4
	add	rax, r9
	mov	QWORD PTR [rcx], rax
	mov	eax, edx
	sar	eax, 10
	add	eax, r11d
	and	eax, 3
	sub	eax, r11d
	cdqe
	sal	rax, 4
	add	rax, r8
	mov	QWORD PTR 8[rcx], rax
	mov	eax, edx
	sar	eax, 20
	and	eax, 1
	mov	BYTE PTR 16[rcx], al
	test	dl, 7
	sete	BYTE PTR 17[rcx]
	mov	r11d, esi
	shr	r11d, 25
	lea	eax, [rdx+r11]
	and	eax, 127
	sub	eax, r11d
	mov	DWORD PTR 20[rcx], eax
	shr	esi, 22
	lea	eax, [rdx+rsi]
	and	eax, 1023
	sub	eax, esi
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, eax
	movss	DWORD PTR 24[rcx], xmm0
	lea	eax, 1023[rdx]
	test	edx, edx
	cmovs	edx, eax
	mov	eax, edx
	sar	eax, 10
	sar	edx, 31
	shr	edx, 22
	add	eax, edx
	and	eax, 1023
	sub	eax, edx
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, eax
	movss	DWORD PTR 28[rcx], xmm0
	add	edi, 1
	add	rcx, 32
	cmp	ebp, edi
	jne	.L11
.L8:
	mov	rax, r12
	add	rsp, 8
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE51:
	.size	generate_random_persons, .-generate_random_persons
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"N = %d\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"Common, ask for something bigger please..."
	.section	.rodata.str1.1
.LC4:
	.string	"Num elements: %lu\n"
.LC5:
	.string	"Size of Person: %lu bytes\n"
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"More that 4GB requested... be reasonable please."
	.section	.rodata.str1.1
.LC7:
	.string	"Total data size: %lu Mo\n"
.LC8:
	.string	"Total data size: %lu Ko\n"
.LC12:
	.string	"count_male"
	.section	.rodata.str1.8
	.align 8
.LC13:
	.string	"%-30s: %10.4lf ms\t %6.2lf ns / op\n"
	.section	.rodata.str1.1
.LC14:
	.string	"max_age"
.LC15:
	.string	"oldest"
.LC16:
	.string	"closest"
.LC17:
	.string	"female_muggles"
	.section	.rodata.str1.8
	.align 8
.LC18:
	.string	"Results of queries: (count_male: %d) (max-age: %d) (oldest: %ld) (closest: %ld) (female-muggles: %d)\n"
	.section	.rodata.str1.1
.LC19:
	.string	"Execution successful"
	.text
	.globl	main
	.type	main, @function
main:
.LFB52:
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
	sub	rsp, 56
	.cfi_def_cfa_offset 112
	cmp	edi, 1
	jg	.L51
	mov	edx, 24
	lea	rsi, .LC2[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	edx, 16777216
	lea	rsi, .LC4[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	edx, 32
	lea	rsi, .LC5[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	r12d, 16777216
	mov	edx, 536870912
.L39:
	shr	rdx, 20
	lea	rsi, .LC7[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
.L21:
	mov	edi, r12d
	call	generate_random_persons
	mov	rbp, rax
	mov	esi, r12d
	mov	rdi, rax
	call	db_init@PLT
	mov	rbx, rax
	mov	rdi, rbp
	call	free@PLT
	movsd	xmm0, QWORD PTR .LC9[rip]
	divsd	xmm0, QWORD PTR .LC0[rip]
	movsd	QWORD PTR 8[rsp], xmm0
	movsd	QWORD PTR 16[rsp], xmm0
	mov	ebp, 10
.L24:
	mov	eax, 0
	call	FLA_Clock
	movsd	QWORD PTR 24[rsp], xmm0
	mov	rdi, rbx
	call	db_count_male@PLT
	mov	DWORD PTR 36[rsp], eax
	mov	eax, 0
	call	FLA_Clock
	subsd	xmm0, QWORD PTR 24[rsp]
	minsd	xmm0, QWORD PTR 16[rsp]
	movsd	QWORD PTR 16[rsp], xmm0
	sub	ebp, 1
	jne	.L24
	test	r12, r12
	js	.L25
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, r12
	movsd	QWORD PTR 40[rsp], xmm2
.L26:
	movsd	xmm6, QWORD PTR 16[rsp]
	movapd	xmm1, xmm6
	divsd	xmm1, QWORD PTR 40[rsp]
	mulsd	xmm6, QWORD PTR .LC11[rip]
	movapd	xmm0, xmm6
	mulsd	xmm1, QWORD PTR .LC10[rip]
	lea	rdx, .LC12[rip]
	lea	rsi, .LC13[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	movsd	xmm7, QWORD PTR 8[rsp]
	movsd	QWORD PTR 16[rsp], xmm7
	mov	r12d, 10
.L29:
	mov	eax, 0
	call	FLA_Clock
	movsd	QWORD PTR 24[rsp], xmm0
	mov	rdi, rbx
	call	db_max_age@PLT
	mov	ebp, eax
	mov	eax, 0
	call	FLA_Clock
	subsd	xmm0, QWORD PTR 24[rsp]
	minsd	xmm0, QWORD PTR 16[rsp]
	movsd	QWORD PTR 16[rsp], xmm0
	sub	r12d, 1
	jne	.L29
	movapd	xmm7, xmm0
	movapd	xmm1, xmm0
	divsd	xmm1, QWORD PTR 40[rsp]
	mulsd	xmm7, QWORD PTR .LC11[rip]
	movapd	xmm0, xmm7
	mulsd	xmm1, QWORD PTR .LC10[rip]
	lea	rdx, .LC14[rip]
	lea	rsi, .LC13[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	movsd	xmm7, QWORD PTR 8[rsp]
	movsd	QWORD PTR 16[rsp], xmm7
	mov	r13d, 10
.L32:
	mov	eax, 0
	call	FLA_Clock
	movsd	QWORD PTR 24[rsp], xmm0
	mov	rdi, rbx
	call	db_oldest@PLT
	mov	r12, rax
	mov	eax, 0
	call	FLA_Clock
	subsd	xmm0, QWORD PTR 24[rsp]
	minsd	xmm0, QWORD PTR 16[rsp]
	movsd	QWORD PTR 16[rsp], xmm0
	sub	r13d, 1
	jne	.L32
	movapd	xmm6, xmm0
	movapd	xmm1, xmm0
	divsd	xmm1, QWORD PTR 40[rsp]
	mulsd	xmm6, QWORD PTR .LC11[rip]
	movapd	xmm0, xmm6
	mulsd	xmm1, QWORD PTR .LC10[rip]
	lea	rdx, .LC15[rip]
	lea	rsi, .LC13[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	movsd	xmm1, QWORD PTR 8[rsp]
	movsd	QWORD PTR 16[rsp], xmm1
	mov	r14d, 10
.L35:
	mov	eax, 0
	call	FLA_Clock
	movsd	QWORD PTR 24[rsp], xmm0
	call	rand@PLT
	mov	r13d, eax
	call	rand@PLT
	mov	edx, r13d
	sar	edx, 31
	shr	edx, 22
	add	r13d, edx
	and	r13d, 1023
	sub	r13d, edx
	cdq
	shr	edx, 22
	add	eax, edx
	and	eax, 1023
	sub	eax, edx
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, eax
	pxor	xmm1, xmm1
	cvtsi2ss	xmm1, r13d
	mov	rdi, rbx
	call	db_closest@PLT
	mov	r13, rax
	mov	eax, 0
	call	FLA_Clock
	subsd	xmm0, QWORD PTR 24[rsp]
	minsd	xmm0, QWORD PTR 16[rsp]
	movsd	QWORD PTR 16[rsp], xmm0
	sub	r14d, 1
	jne	.L35
	movapd	xmm7, xmm0
	movapd	xmm1, xmm0
	divsd	xmm1, QWORD PTR 40[rsp]
	mulsd	xmm7, QWORD PTR .LC11[rip]
	movapd	xmm0, xmm7
	mulsd	xmm1, QWORD PTR .LC10[rip]
	lea	rdx, .LC16[rip]
	lea	rsi, .LC13[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	mov	r15d, 10
.L38:
	mov	eax, 0
	call	FLA_Clock
	movsd	QWORD PTR 16[rsp], xmm0
	mov	rdi, rbx
	call	db_count_female_muggles@PLT
	mov	r14d, eax
	mov	eax, 0
	call	FLA_Clock
	subsd	xmm0, QWORD PTR 16[rsp]
	minsd	xmm0, QWORD PTR 8[rsp]
	movsd	QWORD PTR 8[rsp], xmm0
	sub	r15d, 1
	jne	.L38
	movapd	xmm6, xmm0
	movapd	xmm1, xmm0
	divsd	xmm1, QWORD PTR 40[rsp]
	mulsd	xmm6, QWORD PTR .LC11[rip]
	movapd	xmm0, xmm6
	mulsd	xmm1, QWORD PTR .LC10[rip]
	lea	rdx, .LC17[rip]
	lea	rsi, .LC13[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	sub	rsp, 8
	.cfi_def_cfa_offset 120
	push	r14
	.cfi_def_cfa_offset 128
	mov	r9, r13
	mov	r8, r12
	mov	ecx, ebp
	mov	edx, DWORD PTR 52[rsp]
	lea	rsi, .LC18[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	lea	rdi, .LC19[rip]
	call	puts@PLT
	add	rsp, 16
	.cfi_def_cfa_offset 112
	mov	eax, 0
.L15:
	add	rsp, 56
	.cfi_remember_state
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
.L51:
	.cfi_restore_state
	mov	rdi, QWORD PTR 8[rsi]
	mov	edx, 10
	mov	esi, 0
	call	strtol@PLT
	mov	rbx, rax
	mov	edx, eax
	lea	rsi, .LC2[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	r12d, 1
	mov	ecx, ebx
	sal	r12, cl
	cmp	r12, 63
	ja	.L17
	lea	rdi, .LC3[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L15
.L17:
	mov	rdx, r12
	lea	rsi, .LC4[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	edx, 32
	lea	rsi, .LC5[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	edx, 32
	mov	ecx, ebx
	sal	rdx, cl
	movabs	rax, 4294967296
	cmp	rdx, rax
	ja	.L52
	cmp	rdx, 1048576
	ja	.L39
	shr	rdx, 10
	lea	rsi, .LC8[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	jmp	.L21
.L52:
	lea	rdi, .LC6[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L15
.L25:
	mov	rax, r12
	shr	rax
	and	r12d, 1
	or	rax, r12
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	addsd	xmm0, xmm0
	movsd	QWORD PTR 40[rsp], xmm0
	jmp	.L26
	.cfi_endproc
.LFE52:
	.size	main, .-main
	.comm	rands,536870912,32
	.globl	last_names
	.data
	.align 32
	.type	last_names, @object
	.size	last_names, 64
last_names:
	.string	"Bombadil"
	.zero	7
	.string	"Potter"
	.zero	9
	.string	"Jedusor"
	.zero	8
	.string	"Dumbledore"
	.zero	5
	.globl	first_names
	.align 32
	.type	first_names, @object
	.size	first_names, 64
first_names:
	.string	"Tom"
	.zero	12
	.string	"Arthur"
	.zero	9
	.string	"Harry"
	.zero	10
	.string	"Felix"
	.zero	10
	.globl	gtod_ref_time_sec
	.bss
	.align 8
	.type	gtod_ref_time_sec, @object
	.size	gtod_ref_time_sec, 8
gtod_ref_time_sec:
	.zero	8
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	0
	.align 8
.LC1:
	.long	3894859413
	.long	1041313291
	.align 8
.LC9:
	.long	0
	.long	1072693248
	.align 8
.LC10:
	.long	536870912
	.long	1107468383
	.align 8
.LC11:
	.long	0
	.long	1083129856
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
