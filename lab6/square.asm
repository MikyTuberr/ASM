.386
prog SEGMENT use16
ASSUME cs:prog

display_square PROC
    push ax
    push bx
    push es

    cmp cs:interrupts_counter, 5
    je blink

    jmp not_blink

blink:
    mov cs:interrupts_counter, 0
    mov cs:color, 0
    jmp _pressed

not_blink:
    cmp cs:r_pressed, 1
    je count_time

    jmp not_pressed

count_time:
    cmp cs:r_pressed_time, 0
    je change_color
    dec cs:r_pressed_time

    jmp standard_color

change_color:
    mov cs:color, 4
    jmp _pressed

not_pressed:
    mov cs:r_pressed_time, 32

standard_color:
    mov cs:color, 13

_pressed:
    mov ax, 0A7DAH 
    mov es, ax
    mov bx, 0

    mov cx, cs:_size

upper_side:
    mov al, cs:color
    mov es:[bx], al 
    inc bx
loop upper_side

    mov cx, cs:_size

right_side:
    mov al, cs:color
    mov es:[bx], al 
    add bx, 320
loop right_side

    mov cx, cs:_size

lower_side:
    mov al, cs:color
    mov es:[bx], al 
    dec bx
loop lower_side

    mov cx, cs:_size

left_side:
    mov al, cs:color
    mov es:[bx], al 
    sub bx, 320
loop left_side

    inc cs:interrupts_counter

    pop es
    pop bx
    pop ax

    jmp dword PTR cs:vector8

    interrupts_counter db 0
    r_pressed_time db 0
    _size dw 20
    color db 13
    vector8 dd ?
display_square ENDP

handle_keyboard PROC
    push ax
    push cx
    push dx

    in al, 60h
    cmp al, 19
    je pressed

    cmp al, 147
    je released

    jmp handled

pressed:
    mov cs:r_pressed, 1
    jmp handled

released:
    mov cs:r_pressed, 0

handled:
    pop dx
    pop cx
    pop ax
    jmp dword PTR cs:vector9

    r_pressed db 0
    vector9 dd ?
handle_keyboard ENDP

begin:
    mov ah, 0 
    mov al, 13H ;nr trybu
    int 10H ; tryb sterownika graficznego 
    mov bx, 0
    mov es, bx 

    mov eax, es:[32] 
    mov cs:vector8, eax

    mov ax, SEG display_square
    mov bx, OFFSET display_square
    cli 
    mov es:[32], bx
    mov es:[32+2], ax
    sti 

    mov eax,es:[36]
    mov cs:vector9, eax

    mov ax, SEG handle_keyboard 
    mov bx, OFFSET handle_keyboard 

    cli 
    mov es:[36], bx 
    mov es:[38], ax 
    sti 

_wait:
    mov ah, 1
    int 16h
    jz _wait
    mov ah, 0
    int 16H
    cmp al, 'x' 
    jne _wait 
    mov ah, 0
    mov al, 3h
    int 10h
    mov eax, cs:vector8
    cli
    mov es:[32], eax
    sti
    mov eax, cs:vector9
    cli
    mov es:[36], eax
    sti

    mov ax, 4C00h
    int 21h
prog ENDS

stosik SEGMENT stack
    db 256 dup (?)
stosik ENDS

END begin
