.386
rozkazy SEGMENT use16
ASSUME CS:rozkazy

obsluga_zegara PROC

    push ax
    push bx
    push es

    mov ax, 0B80Ah ;adres pamięci ekranu
    mov es, ax

    mov bx, cs:licznik

   
    mov byte PTR es:[bx+1], 00100110B ; kolor

    cmp cs:direction, 1
    je _up

    cmp cs:direction, 2
    je _left

    cmp cs:direction, 3
    je _down

    cmp cs:direction, 4
    je _right

    jmp dalej
_up:
    mov byte PTR es:[bx], 5Eh ; kod ASCII
    sub bx, 160
    jmp dalej
_left:
    mov byte PTR es:[bx], 3Ch ; kod ASCII
    sub bx, 2
    jmp dalej
_down:
    mov byte PTR es:[bx], 76h ; kod ASCII
    add bx, 160
    jmp dalej

_right:
    mov byte PTR es:[bx], 3Eh ; kod ASCII
    add bx, 2

dalej:
    mov cs:licznik,bx
    ; odtworzenie rejestrów
    pop es
    pop bx
    pop ax
    ; skok do oryginalnej procedury obsługi przerwania zegarowego
    jmp dword PTR cs:wektor8

    licznik dw 320 ; wyświetlanie począwszy od 2. wiersza
    wektor8 dd ?
obsluga_zegara ENDP

handle_keyboard PROC
    push ax
    push cx
    push dx

    in al, 60h

    cmp al, 72
    je up

    cmp al, 75
    je left

    cmp al, 80
    je down

    cmp al, 77
    je right

    ;cmp al, 200
    ;je released

    ;cmp al, 203
    ;je released

    ;cmp al, 208
    ;je released

    ;cmp al, 205
    ;je released
    
    jmp handled

up:
    mov cs:direction, 1
    jmp handled
left:
    mov cs:direction, 2
    jmp handled
down:
    mov cs:direction, 3 
    jmp handled
right:
    mov cs:direction, 4
    jmp handled

;released:
    ;mov cs:direction, 0

handled:
    pop dx
    pop cx
    pop ax
    jmp dword PTR cs:vector9

    direction db 0
    vector9 dd ?
handle_keyboard ENDP

zacznij:
    mov al, 0
    mov ah, 5
    int 10
    mov ax, 0
    mov es,ax 

    mov eax,es:[32] ; adres fizyczny 0*16 + 32 = 32
    mov cs:wektor8, eax

    mov ax, SEG obsluga_zegara ; część segmentowa adresu
    mov bx, OFFSET obsluga_zegara ; offset adresu
    cli ; zablokowanie przerwań

    mov es:[32], bx ; OFFSET
    mov es:[34], ax ; cz. segmentowa
    sti ;odblokowanie przerwań


    mov eax,es:[36]
    mov cs:vector9, eax

    mov ax, SEG handle_keyboard 
    mov bx, OFFSET handle_keyboard 

    cli 
    mov es:[36], bx 
    mov es:[38], ax 
    sti 

aktywne_oczekiwanie:
    mov ah,1
    int 16H

    jz aktywne_oczekiwanie

    mov ah, 0
    int 16H
    cmp al, 'x' ; porównanie z kodem litery 'x'
    jne aktywne_oczekiwanie ; skok, gdy inny znak

    mov eax, cs:wektor8
    cli
    mov es:[32], eax ; przesłanie wartości oryginalnej
    sti
    mov eax, cs:vector9
    cli
    mov es:[36], eax
    sti

    mov al, 0
    mov ah, 4CH
    int 21H
rozkazy ENDS
nasz_stos SEGMENT stack
    db 128 dup (?)
nasz_stos ENDS
END zacznij