(Leonard Eze)[trevordiex@gmail.com]

# An assembly language program which takes an array of integers and computes their sum

The program uses C language io routines for simplicity. The (main.c)[./main.c] file
must be included while compiling

## Compiling
To assemble
    `nasm -felf -o sum.o sum.asm`

To link
    `gcc -m32 -o sum sum.o main.c`

## Usage
./sum