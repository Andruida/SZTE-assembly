.intel_syntax noprefix
.section .data

// E FELETT NE MODOSITSD A FAJLT!

// Feladat: Egeszitsd ki a programot egy adat szekcioban levo cimke megadásával, aminek a neve HELLO és a "Hello World!" karaktersorozatot
// tartalmazza egy ujsor karakterrel. Figyelj arra, hogy a karaktersorozat vegen legyen string lezaro karakter!

// IDE DOLGOZZ:

HELLO: .asciz "Hello World!\n"

// EZ ALATT NE MODOSITSD A FAJLT!

.section .text
.global main
main:
    push ebp
    mov ebp, esp

    push offset HELLO
    call printf
    add esp, 4

    mov esp, ebp
    pop ebp
    mov eax, 0
    ret
