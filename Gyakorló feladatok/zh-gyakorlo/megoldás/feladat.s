.syntax unified
.cpu cortex-a7

.data
fmt:    .asciz  "r6 %d, r7 %d\n"

.text
.global feladatX
feladatX: // int feladatX(int input[], int op, int opArg, int output[])

    push {r4-r11, lr}
    mov fp, sp

    mov r4, #0 // int counter
    mov r5, r0 // ptr input_idx

_loop:
    ldr r6, [r5], #4        // value
    teq r6, #0
    beq _loop_end

_if:
    ldr r7, =0xbadc0ffe
    teq r1, r7
    bne _else_if

    sdiv r7, r6, r2
    mul r7, r2, r7

    teq r6, r7
    beq _end_if

    str r6, [r3, r4, LSL #2]
    add r4, r4, #1

    b _end_if

_else_if:
    ldr r7, =0x11223344
    teq r1, r7
    bne _else

    mov r8, #3
    sdiv r7, r6, r8
    cmp r7, r2
    bge _end_if

    str r6, [r3, r4, LSL #2]
    add r4, r4, #1

    b _end_if

_else:
    ldr r7, =-2048
    str r7, [r3, r4, LSL #2]
    add r4, r4, #1

_end_if:

    b _loop
_loop_end:

    mov r0, r4
    mov sp, fp
    pop {r4-r11, pc}