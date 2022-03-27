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
	vxorpd	xmm0, xmm0, xmm0
	vucomisd	xmm0, QWORD PTR gtod_ref_time_sec[rip]
	jp	.L2
	jne	.L2
	vxorpd	xmm3, xmm3, xmm3
	vcvtsi2sd	xmm0, xmm3, QWORD PTR [rsp]
	vmovsd	QWORD PTR gtod_ref_time_sec[rip], xmm0
.L2:
	vxorpd	xmm2, xmm2, xmm2
	vcvtsi2sd	xmm1, xmm2, QWORD PTR [rsp]
	vsubsd	xmm1, xmm1, QWORD PTR gtod_ref_time_sec[rip]
	vcvtsi2sd	xmm0, xmm2, QWORD PTR 8[rsp]
	vmulsd	xmm0, xmm0, QWORD PTR .LC1[rip]
	vaddsd	xmm0, xmm1, xmm0
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
	vxorps	xmm1, xmm1, xmm1
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
	vcvtsi2ss	xmm0, xmm1, eax
	vmovss	DWORD PTR 24[rcx], xmm0
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
	vcvtsi2ss	xmm0, xmm1, eax
	vmovss	DWORD PTR 28[rcx], xmm0
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
	.globl	generate_random_requests
	.type	generate_random_requests, @function
generate_random_requests:
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
	sub	rsp, 24
	.cfi_def_cfa_offset 80
	mov	DWORD PTR 4[rsp], edi
	mov	r13d, esi
	movsx	rdi, edi
	sal	rdi, 3
	call	malloc@PLT
	mov	r14, rax
	movsx	rdi, r13d
	sal	rdi, 5
	call	malloc@PLT
	mov	QWORD PTR 8[rsp], rax
	test	r13d, r13d
	jle	.L15
	mov	rbx, rax
	mov	ebp, 0
	lea	r15, rands[rip]
	jmp	.L18
.L17:
	call	rand@PLT
	mov	al, 0
	mov	edx, 0
	div	DWORD PTR 4[rsp]
	mov	DWORD PTR [rbx], r12d
	mov	eax, edx
	mov	QWORD PTR 8[rbx], rax
	mov	DWORD PTR 16[rbx], 20
	lea	rax, [r14+rax*8]
	mov	QWORD PTR 24[rbx], rax
	add	ebp, 1
	add	rbx, 32
	cmp	r13d, ebp
	je	.L15
.L18:
	mov	edx, ebp
	sar	edx, 31
	shr	edx, 5
	lea	eax, 0[rbp+rdx]
	and	eax, 134217727
	sub	eax, edx
	cdqe
	mov	edx, DWORD PTR [r15+rax*4]
	movsx	rax, edx
	imul	rax, rax, 1374389535
	sar	rax, 37
	mov	ecx, edx
	sar	ecx, 31
	sub	eax, ecx
	imul	eax, eax, 100
	sub	edx, eax
	mov	r12d, 3
	cmp	edx, 69
	jle	.L17
	cmp	edx, 80
	setg	r12b
	movzx	r12d, r12b
	jmp	.L17
.L15:
	mov	rax, QWORD PTR 8[rsp]
	add	rsp, 24
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
.LFE52:
	.size	generate_random_requests, .-generate_random_requests
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Total"
.LC3:
	.string	"Sum individual"
.LC4:
	.string	"Expected"
.LC5:
	.string	"%20s\t%20s\t%20s\n"
.LC6:
	.string	"%20u\t%20u\t%20u\n"
	.text
	.globl	report_accesses_and_clear
	.type	report_accesses_and_clear, @function
report_accesses_and_clear:
.LFB53:
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
	mov	rbx, rdi
	mov	ebp, esi
	call	db_total_accesses@PLT
	mov	r13d, eax
	mov	rdi, rbx
	call	db_sum_individual_accesses@PLT
	mov	r12d, eax
	lea	r8, .LC2[rip]
	lea	rcx, .LC3[rip]
	lea	rdx, .LC4[rip]
	lea	rsi, .LC5[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	r8d, r13d
	mov	ecx, r12d
	mov	edx, ebp
	lea	rsi, .LC6[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	rdi, rbx
	call	db_clear_accesses@PLT
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
.LFE53:
	.size	report_accesses_and_clear, .-report_accesses_and_clear
	.section	.rodata.str1.1
.LC7:
	.string	"N = %d\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC8:
	.string	"Common, ask for something bigger please..."
	.section	.rodata.str1.1
.LC9:
	.string	"Num elements: %lu\n"
.LC10:
	.string	"Size of Person: %lu bytes\n"
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"More that 4GB requested... be reasonable please."
	.section	.rodata.str1.1
.LC12:
	.string	"Total data size: %lu Mo\n"
.LC13:
	.string	"Total data size: %lu Ko\n"
.LC14:
	.string	"\n======= SIMD ======="
.LC18:
	.string	"max_age"
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"%-30s: %10.4lf ms\t %6.2lf ns / op\n"
	.section	.rodata.str1.1
.LC22:
	.string	"min_dist"
.LC23:
	.string	"closest"
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"Results of queries: (max-age: %d) (min-dist: %.2f) (closest: %ld) \n"
	.align 8
.LC25:
	.string	"\n======= Multithreading (%d threads) =======\n"
	.section	.rodata.str1.1
.LC27:
	.string	"many_requests"
.LC28:
	.string	"many_requests_par"
.LC29:
	.string	"many_requests_par_split"
	.section	.rodata.str1.8
	.align 8
.LC30:
	.string	"\nExecution successful, exiting."
	.text
	.globl	main
	.type	main, @function
main:
.LFB54:
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
	sub	rsp, 40
	.cfi_def_cfa_offset 80
	cmp	edi, 1
	jg	.L53
	mov	edx, 24
	lea	rsi, .LC7[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	edx, 16777216
	lea	rsi, .LC9[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	edx, 32
	lea	rsi, .LC10[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	edx, 536870912
	mov	ebp, 16777216
.L45:
	shr	rdx, 20
	lea	rsi, .LC12[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
.L30:
	mov	r13d, ebp
	mov	edi, ebp
	call	generate_random_persons
	mov	r12, rax
	mov	esi, ebp
	mov	rdi, rax
	call	db_init@PLT
	mov	rbx, rax
	mov	rdi, r12
	call	free@PLT
	lea	rdi, .LC14[rip]
	call	puts@PLT
	vmovsd	xmm0, QWORD PTR .LC15[rip]
	vdivsd	xmm7, xmm0, QWORD PTR .LC0[rip]
	vmovsd	QWORD PTR [rsp], xmm7
	mov	eax, 0
	call	FLA_Clock
	vmovsd	QWORD PTR 8[rsp], xmm0
	mov	rdi, rbx
	call	db_max_age@PLT
	mov	r12d, eax
	mov	eax, 0
	call	FLA_Clock
	vsubsd	xmm0, xmm0, QWORD PTR 8[rsp]
	vminsd	xmm0, xmm0, QWORD PTR [rsp]
	test	rbp, rbp
	js	.L33
	vxorpd	xmm7, xmm7, xmm7
	vcvtsi2sd	xmm1, xmm7, rbp
	vmovsd	QWORD PTR 8[rsp], xmm1
.L34:
	vdivsd	xmm1, xmm0, QWORD PTR 8[rsp]
	vmulsd	xmm0, xmm0, QWORD PTR .LC17[rip]
	vmulsd	xmm1, xmm1, QWORD PTR .LC16[rip]
	lea	rdx, .LC18[rip]
	lea	rsi, .LC19[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	mov	eax, 0
	call	FLA_Clock
	vmovsd	QWORD PTR 16[rsp], xmm0
	vmovss	xmm1, DWORD PTR .LC20[rip]
	vmovss	xmm0, DWORD PTR .LC21[rip]
	mov	rdi, rbx
	call	db_min_dist@PLT
	vmovss	DWORD PTR 28[rsp], xmm0
	mov	eax, 0
	call	FLA_Clock
	vsubsd	xmm0, xmm0, QWORD PTR 16[rsp]
	vminsd	xmm0, xmm0, QWORD PTR [rsp]
	vdivsd	xmm1, xmm0, QWORD PTR 8[rsp]
	vmulsd	xmm0, xmm0, QWORD PTR .LC17[rip]
	vmulsd	xmm1, xmm1, QWORD PTR .LC16[rip]
	lea	rdx, .LC22[rip]
	lea	rsi, .LC19[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	mov	eax, 0
	call	FLA_Clock
	vmovsd	QWORD PTR 16[rsp], xmm0
	vmovss	xmm1, DWORD PTR .LC20[rip]
	vmovss	xmm0, DWORD PTR .LC21[rip]
	mov	rdi, rbx
	call	db_closest@PLT
	mov	rbp, rax
	mov	eax, 0
	call	FLA_Clock
	vsubsd	xmm0, xmm0, QWORD PTR 16[rsp]
	vminsd	xmm0, xmm0, QWORD PTR [rsp]
	vdivsd	xmm1, xmm0, QWORD PTR 8[rsp]
	vmulsd	xmm0, xmm0, QWORD PTR .LC17[rip]
	vmulsd	xmm1, xmm1, QWORD PTR .LC16[rip]
	lea	rdx, .LC23[rip]
	lea	rsi, .LC19[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	vcvtss2sd	xmm0, xmm0, DWORD PTR 28[rsp]
	mov	rcx, rbp
	mov	edx, r12d
	lea	rsi, .LC24[rip]
	mov	edi, 1
	mov	eax, 1
	call	__printf_chk@PLT
	mov	edx, 4
	lea	rsi, .LC25[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	esi, 10485760
	mov	edi, r13d
	call	generate_random_requests
	mov	rbp, rax
	mov	eax, 0
	call	FLA_Clock
	vmovsd	QWORD PTR 8[rsp], xmm0
	mov	edx, 10485760
	mov	rsi, rbp
	mov	rdi, rbx
	call	db_process_many_requests@PLT
	mov	eax, 0
	call	FLA_Clock
	vsubsd	xmm0, xmm0, QWORD PTR 8[rsp]
	vminsd	xmm0, xmm0, QWORD PTR [rsp]
	vdivsd	xmm1, xmm0, QWORD PTR .LC26[rip]
	vmulsd	xmm0, xmm0, QWORD PTR .LC17[rip]
	vmulsd	xmm1, xmm1, QWORD PTR .LC16[rip]
	lea	rdx, .LC27[rip]
	lea	rsi, .LC19[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	mov	esi, 10485760
	mov	rdi, rbx
	call	report_accesses_and_clear
	mov	eax, 0
	call	FLA_Clock
	vmovsd	QWORD PTR 8[rsp], xmm0
	mov	r8d, 0
	mov	ecx, 4
	mov	edx, 10485760
	mov	rsi, rbp
	mov	rdi, rbx
	call	db_process_many_requests_parallel@PLT
	mov	eax, 0
	call	FLA_Clock
	vsubsd	xmm0, xmm0, QWORD PTR 8[rsp]
	vminsd	xmm0, xmm0, QWORD PTR [rsp]
	vdivsd	xmm1, xmm0, QWORD PTR .LC26[rip]
	vmulsd	xmm0, xmm0, QWORD PTR .LC17[rip]
	vmulsd	xmm1, xmm1, QWORD PTR .LC16[rip]
	lea	rdx, .LC28[rip]
	lea	rsi, .LC19[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	mov	esi, 10485760
	mov	rdi, rbx
	call	report_accesses_and_clear
	mov	eax, 0
	call	FLA_Clock
	vmovsd	QWORD PTR 8[rsp], xmm0
	mov	r8d, 1
	mov	ecx, 4
	mov	edx, 10485760
	mov	rsi, rbp
	mov	rdi, rbx
	call	db_process_many_requests_parallel@PLT
	mov	eax, 0
	call	FLA_Clock
	vsubsd	xmm0, xmm0, QWORD PTR 8[rsp]
	vminsd	xmm4, xmm0, QWORD PTR [rsp]
	vdivsd	xmm1, xmm4, QWORD PTR .LC26[rip]
	vmulsd	xmm0, xmm4, QWORD PTR .LC17[rip]
	vmulsd	xmm1, xmm1, QWORD PTR .LC16[rip]
	lea	rdx, .LC29[rip]
	lea	rsi, .LC19[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	mov	esi, 10485760
	mov	rdi, rbx
	call	report_accesses_and_clear
	lea	rdi, .LC30[rip]
	call	puts@PLT
	mov	eax, 0
.L24:
	add	rsp, 40
	.cfi_remember_state
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
.L53:
	.cfi_restore_state
	mov	rdi, QWORD PTR 8[rsi]
	mov	edx, 10
	mov	esi, 0
	call	strtol@PLT
	mov	rbx, rax
	mov	edx, eax
	lea	rsi, .LC7[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	ebp, 1
	mov	ecx, ebx
	sal	rbp, cl
	cmp	rbp, 63
	ja	.L26
	lea	rdi, .LC8[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L24
.L26:
	mov	rdx, rbp
	lea	rsi, .LC9[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	edx, 32
	lea	rsi, .LC10[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	edx, 32
	mov	ecx, ebx
	sal	rdx, cl
	movabs	rax, 4294967296
	cmp	rdx, rax
	ja	.L54
	cmp	rdx, 1048576
	ja	.L45
	shr	rdx, 10
	lea	rsi, .LC13[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	jmp	.L30
.L54:
	lea	rdi, .LC11[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L24
.L33:
	mov	rax, rbp
	shr	rax
	and	ebp, 1
	or	rax, rbp
	vxorpd	xmm6, xmm6, xmm6
	vcvtsi2sd	xmm1, xmm6, rax
	vaddsd	xmm6, xmm1, xmm1
	vmovsd	QWORD PTR 8[rsp], xmm6
	jmp	.L34
	.cfi_endproc
.LFE54:
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
.LC15:
	.long	0
	.long	1072693248
	.align 8
.LC16:
	.long	536870912
	.long	1107468383
	.align 8
.LC17:
	.long	0
	.long	1083129856
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC20:
	.long	3221644902
	.align 4
.LC21:
	.long	3213675725
	.section	.rodata.cst8
	.align 8
.LC26:
	.long	0
	.long	1097072640
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
