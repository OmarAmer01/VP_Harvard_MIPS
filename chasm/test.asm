nop
nop

movi ax, 0xFd
movi bx, 0xdf

push ax
pop bx
push bx
pop cx
out cx
inc bx
out bx