.syntax unified
.cpu cortex-a7

.data

.text
.global feladatDiver
feladatDiver: // int feladatDiver(int input[], int divisor, int output[])

    push {r4-r11, lr}

    mov r4, #0      // count

_loop:
    ldr r5, [r0], #4    //value 

    teq r5, #0
    beq _end_loop

    sdiv r6, r5, r1     // r6 = r5 / r1
    mul  r6, r1, r6     // r6 = r6 * r1
    teq r6, r5
    beq _end_if

    str r5, [r2, r4, LSL #2]
    add r4, r4, #1

_end_if:

    b _loop

_end_loop:

    mov r0, r4
    pop {r4-r11, pc}
