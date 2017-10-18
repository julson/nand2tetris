// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

        (INFINITE_LOOP)

        //Reset fill loop to starting screen address
        @SCREEN
        D=A

        @CURRENT_ADDR
        M=D

        //Determine what value to set for screen
        @KBD
	D=M

        @BLACKEN
        D;JNE

        @FILL_VALUE
        M=0

        @FILL
        0;JMP

        (BLACKEN)
        @FILL_VALUE
        M=-1

        (FILL)
        @FILL_VALUE
        D=M

        @CURRENT_ADDR
        A=M
        M=D

        D=A+1
        @CURRENT_ADDR
        M=D

        @KBD
        D=D-A

        @FILL
        D;JNE

        @INFINITE_LOOP
        0;JMP
