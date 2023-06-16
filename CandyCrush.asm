;Muhammad Usman
;20i-0416

.model small
.stack 100h
.data

Welcomestr db 'CANDY CRUSH $'
name db 'By Usman $'
username byte 50 dup ('$')
sqr1 word 50 dup (0)
tri1 word 50 dup (0)
hat1 word 50 dup (?)
diag1 word 50 dup (?)
cross1 word 50 dup (?)
kite1 word 100 dup (?)
arr word 150 dup(?)
score db 'SCORE $' 
msg1 db '  WELCOME TO CANDY CRUSH  $'
msg2 db '  RULES  $'
msg3 db '(1) ONLY 15 MOVES ARE ALLOWED  $'
msg4 db '(2) Player will get score when candies are crushed $'
msg5 db '(3) For candies to be crushed atleast three of them should be in row or column  $'
msg6 db '(4) Scary candy will get you the highest score   $'
msg7 db 'press enter to continue...$'
msg8 db 'PLEASE Enter your name:$'
;delay db 0
di1 dw 0
r1 dw 0
r2 dw 0
r3 dw 0
r4 dw 0
r9 dw 0
a316 dw 0
a1 dw 0
a2 dw 0
a3 dw 0
a4 dw 0
a5 dw 0
da1 dw 0
da2 dw 0
da3 dw 0
da4 dw 0
da5 dw 0
da6 dw 0
fname db 'file3.txt'
handle dw  ?
var dw 65000
len dw lengthof var
temp dw ?
dcount db 0
da7 dw 0
da8 dw 0
da9 dw 0
da10 dw 0
da11 dw 0
r7 dw 0
a11 dw 2
a22 dw 2
a33 dw 2
a44 dw 2
a55 dw 2
a66 dw 2
a77 dw 0
a88 dw 0
a99 dw 0
r6 dw 0
a110 dw 0
a111 dw 0
a112 dw 0
a113 dw 0
a114 dw 0
a115 dw 0
a116 dw 0
a117 dw 0
a118 dw 0
a210 dw 0
a211 dw 0
a212 dw 0
a213 dw 0

a310 dw 0
a311 dw 0
a312 dw 0
a313 dw 0
a314 dw 0
a315 dw 0

a410 dw 0
a411 dw 0
a412 dw 0
a413 dw 0
a414 dw 0
a415 dw 0
a416 dw 0
a417 dw 0


count db 0
count1 db 0
row_inc dw 0
col_inc dw 0
seed dw 0
rand dw 0

.code
mov ax,@data
mov ds,ax


;from line 109 to 115 for random generaton number
mov ah,0h
int 1ah
add dx,seed
mov ax,25173
mul dx
add ax,13849
mov seed,ax

mov ah,0
mov al,12h	;new window
int 10h

mov ah,02h
mov bx,0
mov dh,10 ; x axix
mov dl,30
int 10h

mov dx,offset msg1
mov ah,09h
int 21h

mov ah,02h
mov bx,0
mov dh,12 ; x axix
mov dl,30
int 10h

mov dx,offset msg8
mov ah,09
int 21h


 




; name input
mov si,0
input:
mov ah,01h
int 21h
mov username[si],al
inc si
cmp al,13
jne input



;window for rules

mov ah,0
mov al,12h	;new window
int 10h

mov ah,02h
mov bx,0
mov dh,9 ; x axix
mov dl,25
int 10h

mov dx,offset  msg1
mov ah,09
int 21h

mov ah,02h
mov bx,0
mov dh,10 ; x axix
mov dl,32
int 10h

mov dx,offset  msg2
mov ah,09
int 21h

mov ah,02h
mov bx,0
mov dh,12 ; x axix
mov dl,25
int 10h

mov dx,offset  msg3
mov ah,09
int 21h

mov ah,02h
mov bx,0
mov dh,13 ; x axix
mov dl,20
int 10h
mov dx,offset  msg4
mov ah,09
int 21h


mov ah,02h
mov bx,0
mov dh,14 ; x axix
mov dl,2
int 10h

mov dx,offset  msg5
mov ah,09
int 21h


mov ah,02h
mov bx,0
mov dh,15 ; x axix
mov dl,20
int 10h


mov dx,offset  msg6
mov ah,09
int 21h


mov ah,02h
mov bx,0
mov dh,18 ; x axix
mov dl,30
int 10h



mov dx,offset  msg7
mov ah,09
int 21h

inpt1:
mov ah,01
int 21h
cmp al,13
jne inpt1



mov ah,0
mov al,12h;new window
int 10h

mov ah,02h
mov bx,0
mov dh,5 ; x axix
mov dl,60
int 10h


mov dx, offset score
mov ah,09h
int 21h

mov ah,02h
mov bx,0
mov dh,5 ; x axix
mov dl,65
int 10h


mov dx, a114
mov ah,02h
int 21h


mov ah,02h
mov bx,0
mov dh,3 ; to move up or down
mov dl,60
int 10h

mov dx, offset username
mov ah,09h
int 21h



mov si,0
mov sqr1[0],1
mov tri1[0],2
mov diag1[0],3
mov cross1[0],4
mov hat1[0],5
mov kite1[0],6



;from line 301 to 549 for making board and random candies

mov col_inc,100 ;first block intialistaion
mov row_inc,50  ;first block  initiliasation
 mov count,0 ;number of boxes in a row
 
 mov ah,0ch
mov al,0fh

mov cx,col_inc
mov dx,row_inc


mov count,0
.while count<7

mov count1,0

.while count1<7

mov cx,col_inc
mov dx,row_inc
mov a1,0
mov a2,0
mov ah,0ch
mov al,0fh			;resetting
call vertical_22;vertical
call horizontal_33;horizontal


mov rand,0
.while rand == 0
call random
.endw

.if rand == 1;SQUARE
mov si,a77
mov ax,rand
mov arr[si],ax
add a77,2
mov ah,0ch
mov al,04h
mov cx,col_inc
mov dx,row_inc
mov si,a11
mov sqr1[si],cx
add a11,2
mov si,a11
mov sqr1[si],dx
add a11,2
add col_inc,10
add row_inc,10
mov cx,col_inc
mov dx,row_inc
mov a1,0
mov a2,0			;resetting
call vertical_221;vertical
call horizontal_331;horizontal
mov cx,col_inc
mov dx,row_inc

sub col_inc,10
sub row_inc,10

.elseif rand==2;TRIANGLE
mov si,a77
mov bx,rand
mov arr[si],bx
add a77,2

mov ah,0ch
mov al,03h
mov cx,col_inc
mov dx,row_inc
mov si,a22
mov tri1[si],cx
add a22,2
mov si,a22
mov tri1[si],dx
add a22,2
add col_inc,20
add row_inc,25
mov cx,col_inc ;column
mov dx,row_inc ; row
mov a1,0
mov a2,0
mov a3,0
call digonals_t
mov cx,col_inc
mov dx,row_inc

sub col_inc,20
sub row_inc,25

.elseif rand==3;DIAGONAL
mov si,a77
mov bx,rand
mov arr[si],bx
add a77,2

mov a1,0
mov a2,0
mov a3,0
mov ah,0ch
mov al,02h
mov cx,col_inc
mov dx,row_inc
mov si,a33
mov diag1[si],cx
add a33,2
mov si,a33
mov diag1[si],dx
add a33,2

add row_inc,20
add col_inc,35
mov cx,col_inc ;column
mov dx,row_inc ; row
call digonals_t1
mov cx,col_inc
mov dx,row_inc

sub row_inc,20
sub col_inc,35

.elseif rand==4;CROSS
mov si,a77
mov bx,rand
mov arr[si],bx
add a77,2
mov a1,0
mov a2,0
mov a3,0
mov ah,0ch
mov al,05h
mov cx,col_inc
mov dx,row_inc
mov si,a44
mov cross1[si],cx
add a44,2
mov si,a44
mov cross1[si],dx
add a44,2
add row_inc,10
add col_inc,40

mov cx,col_inc ;column
mov dx,row_inc ; row
call digonals_tL ;left diagnol
sub col_inc,30
mov cx,col_inc
mov dx,row_inc
add cx,30
mov a1,cx
sub cx,30
add dx,30
mov a3,dx
sub dx,30
call digonals_tR
mov cx,col_inc
mov dx,row_inc

sub row_inc,10
sub col_inc,10

.elseif rand==5;HAT
mov si,a77
mov bx,rand
mov arr[si],bx
add a77,2

mov a1,0
mov a2,0
mov a3,0
mov ah,0ch
mov al,06h
mov cx,col_inc
mov dx,row_inc
mov si,a55
mov hat1[si],cx
add a55,2
mov si,a55
mov hat1[si],dx
add a55,2

add row_inc,20
add col_inc,25
mov cx,col_inc ;column
mov dx,row_inc ; row
add cx,20
mov a1,cx
sub cx,20
add dx,20
mov a3,dx
sub dx,20
call digonals_t3
mov cx,col_inc
mov dx,row_inc
add cx,20
mov a1,cx
sub cx,20
add dx,20
mov a3,dx
sub dx,20
call digonals_tR
mov cx,col_inc
mov dx,row_inc

sub row_inc,20
sub col_inc,25

.elseif rand==6;BOMB
mov si,a77
mov bx,rand
mov arr[si],bx
add a77,2

mov ah,0ch
mov al,0Eh
mov cx,col_inc
mov dx,row_inc
mov si,a66
mov kite1[si],cx
add a66,2
mov si,a66
mov kite1[si],dx
add a66,2

add row_inc,5
add col_inc,30
mov cx,col_inc
mov dx,row_inc
call bomb2
mov cx,col_inc
mov dx,row_inc

sub row_inc,5
sub col_inc,30
.endif

add col_inc,50
;mov rand,0
inc count1
.endw

mov col_inc,100
add row_inc,50
mov rand,0
inc count
.endw


;from 556 to 577 for proper functioning of mouse


mov ax,0
int 33h

;call delay
mov ax,01
int 33h

mov cx,100
mov dx,450
mov ax,7
int 33h

mov cx,50
mov dx,400
mov ax,8
int 33h

mov cx,100
mov dx,50

mov ax,4
int 33h

 
; here is loop for 15 moves which are given to player
.while r2<15

mov da1,0
mov da2,0
mov da3,0
mov da4,0
mov da5,0
mov da6,0
mov da8,0
mov da9,0
mov a110,0
mov a111,0
mov a112,0
mov a113,0
mov a114,0
mov a115,0
mov a117,0
mov a118,0
mov a88,0
mov a99,0
mov a310,0




mov ax,05
 int 33h

;if left key ias pressed of mouse

.if bx==1
mov ax,03
int 33h
call range
mov si,2
sub cx,da8
sub dx,da9

.while si<a11
.if da1==0
.if cx==sqr1[si]
 add da1,1
 add si,2
 .endif
 .endif
  
 .if dx==sqr1[si]
 add da1,1
 jmp l1
 .endif
add si,2
.endw
l1:
mov si,2


.while si<a22
.if da2==0
.if cx==tri1[si]
 add da2,1
 add si,2
 .endif
 .endif
  
 .if dx==tri1[si]
 add da2,1
 jmp l2
 .endif
add si,2
.endw
l2:
mov si,2

.while si<a33
.if da3==0
.if cx==diag1[si]
 add da3,1
 add si,2
 .endif
 .endif
  
 .if dx==diag1[si]
 add da3,1
 jmp l3
 .endif
add si,2
.endw
l3:
mov si,2
.while si<a44
.if da4==0
.if cx==cross1[si]
 add da4,1
 add si,2
 .endif
 .endif
  
 .if dx==cross1[si]
 add da4,1
 jmp l4
 .endif
add si,2
.endw
l4:
mov si,2
.while si<a55
.if da5==0
.if cx==hat1[si]
 add da5,1
 add si,2
 .endif
 .endif
  
 .if dx==hat1[si]
 add da5,1
 jmp l5
 .endif
add si,2
.endw
l5:
mov si,2
.while si<a66
.if da6==0
.if cx==kite1[si]
 add da6,1
 add si,2
 .endif
 .endif
  
 .if dx==kite1[si]
 add da6,1
 jmp l6
 .endif
add si,2
.endw

l6:

;from line 719 to 767 here is a logic for findind a specific in a box where mouse is clicked

mov a88,100
mov a99,50

mov count,0
mov bx,0

.while count<7
mov count1,0
.while count1<7
.if a115==0
.if cx==a88    
mov bx,a110
mov a112,bx
add a115,1
.endif
.endif
add a110,2
add a88,50
inc count1
.endw

.if a118==0
.if dx==a99
mov bx,a111
mov a113,bx
add a118,1
.endif
.endif


mov a88,100
add a111,2

add a99, 50

inc count
.endw

mov dx,0
mov bx,7
mov ax,a113
mul bx

;add a112,1
add ax,a112
mov a116,ax


mov si,ax
mov ah,02h
mov bx,0
mov dh,12 ; to move up or down
mov dl,60
int 10h

mov dx,0
mov si,a116
mov dx, arr[si]
add dx,48
mov ah,02h
int 21h


call delay
; swap function basically gets the second box coordinates and then find which candy is available there
call swap

mov bx,0

.if a316==1

add r2,1

call delay

;logic for swappinf two candies
mov bx,a116
mov cx,arr[bx]

mov si,a116
mov bx,arr[si]
mov si,a117
mov ax,arr[si]
mov si,a116
mov arr[si],ax
mov si,a117
mov arr[si],bx

; that proc will make board again on the bassis of random numbers stored in array
call populateboard


mov bx,a117
mov cx,arr[bx]

.if cx==6
mov bx,a116
mov ax,arr[bx]
mov r6,ax


mov cx,r6
mov r9,0
mov bx,a77
mov si,0
.while r9<bx
.if arr[si]==cx


;mov arr[si],7
mov r7,si

call fill

mov cx,r6
mov si,r7
.endif
add si,2
add r9,2
mov bx,a77
.endw

call delay
call populateboard
.endif


;from 884 to 968 here is logic for fibndibng combos either horizontal or vertical


mov si,a117
mov bx,arr[si] 
mov a114,bx

.if arr[si+2]==bx
.if arr[si+4]==bx
mov arr[si],0
mov a311,si
add a311,2
mov a312,si
add a312,4
mov arr[si+2],0
mov arr[si+4],0
inc di1
inc a410
.endif
.endif

.if arr[si-2]==bx
.if arr[si-4]==bx
mov arr[si],0
mov a311,si
sub a311,2
mov a312,si
sub a312,4
mov arr[si-2],0
mov arr[si-4],0
inc di1
inc a410
.endif
.endif

.if arr[si-2]==bx
.if arr[si+2]==bx
mov arr[si],0
mov a311,si
sub a311,2
mov a312,si
add a312,2
mov arr[si-2],0
mov arr[si+2],0
inc di1
inc a410
.endif
.endif

.if arr[si-14]==bx
.if arr[si-28]==bx
mov arr[si],0
mov a311,si
sub a311,14
mov a312,si
sub a312,28
mov arr[si-14],0
mov arr[si-28],0
inc di1
inc a411
.endif
.endif


.if arr[si-14]==bx
.if arr[si+14]==bx
mov arr[si],0
mov a311,si
sub a311,14
mov a312,si
add a312,14
mov arr[si-14],0
mov arr[si+14],0
inc di1
inc a411
.endif
.endif

.if arr[si+14]==bx
.if arr[si+28]==bx
mov arr[si],0
mov a311,si
add a311,14
mov a312,si
add a312,28
mov arr[si+14],0
mov arr[si+28],0
inc di1
inc a411
.endif
.endif

;mov arr[0],5
;mov arr[4],2

call delay
;add a114,1
;mov bx,a117
;mov cx,arr[bx]
call populateboard

; from there throughout the logic the logic of filling candies from up to down
.if a410>0 || a411>0
.if a113==0
mov rand,0
.while rand == 0
call random
.endw
mov bx,rand
mov arr[si],bx
mov rand,0
.while rand == 0
call random
.endw
mov bx,rand
mov si,a311
mov arr[si],bx
mov rand,0
.while rand == 0
call random
.endw
mov bx,rand
mov si,a312
mov arr[si],bx



.endif
.endif



mov ax,a113
mov dx,0
mov bx,2
div bx


mov a417,ax


.if a113>0

.if a410>0

mov ah,02h
mov bx,0
mov dh,22 ; to move up or down
mov dl,70
int 10h

mov dx,0

mov dx, a417
add dx,48
mov ah,02h
int 21h

mov si,a117
mov cx,a417

.while a310<cx


mov bx,si
sub bx,14
mov a313,bx
mov bx,arr[bx]
mov arr[si],bx
mov si,a313


mov bx,a311
sub bx,14
mov a314,bx
mov bx,arr[bx]
mov si,a311
mov arr[si],bx
mov bx,a314
mov a311,bx

mov bx,a312
sub bx,14
mov a315,bx
mov bx,arr[bx]
mov si,a312
mov arr[si],bx
mov bx,a315
mov a312,bx


mov ah,02h
mov bx,0
mov dh,24 ; to move up or down
mov dl,60
int 10h

mov dx,0

mov dx, bx
add dx,48
mov ah,02h
int 21h
mov si,a313
inc a310
.endw
.endif

.if a410>0

mov rand,0
.while rand == 0
call random
.endw
mov bx,rand
mov arr[si],bx
mov rand,0
.while rand == 0
call random
.endw
mov bx,rand
mov si,a311
mov arr[si],bx
mov rand,0
.while rand == 0
call random
.endw
mov bx,rand
mov si,a312
mov arr[si],bx

.endif


.if a411>0

mov ah,02h
mov bx,0
mov dh,22 ; to move up or down
mov dl,60
int 10h

mov dx,0
mov si,a117
mov dx, a417
add dx,48
mov ah,02h
int 21h

.while a310<ax

mov bx,si
sub bx,42
mov a313,bx
mov bx,arr[bx]
mov arr[si],bx
mov si,a313

mov bx,a311
sub bx,42
mov a314,bx
mov bx,arr[bx]
mov si,a311
mov arr[si],bx
mov bx,a314
mov a311,bx

mov bx,a312
sub bx,42
mov a315,bx
mov bx,arr[bx]
mov si,a312
mov arr[si],bx
mov bx,a315
mov a312,bx

mov si,a313


inc a310

.endw
.endif

.if a411>0

mov rand,0
.while rand == 0
call random
.endw
mov bx,rand
mov arr[si],bx
mov rand,0
.while rand == 0
call random
.endw
mov bx,rand
mov si,a311
mov arr[si],bx
mov rand,0
.while rand == 0
call random
.endw
mov bx,rand
mov si,a312
mov arr[si],bx

.endif

.endif



mov a316,0
mov a310,0
mov a410,0
mov a411,0
mov a117,0
mov a116,0
mov r3,0
.endif

.endif

mov r3,0
mov bx,a77
mov si,0
.while r3<bx
.if arr[si]==0 

.while rand == 0
call random
.endw
mov cx , rand
mov arr[si],cx

.endif
add si,2
add r3,2
.endw


call delay
call populateboard



mov bx,0
.endw
; it jumps to end the function
jmp exit

mov si,0


;function for filling the candies which are swapped by bomb
fill proc 
mov a313,0
mov si,r7
mov dx,0
mov ax,si
mov bx,14
div bx
mov bx,0
mov a310,0
.while a310<ax
mov bx,si
sub bx,14
mov a313,bx
mov bx,arr[bx]
mov arr[si],bx
mov si,a313
inc a310
.endw

mov rand,0
.while rand == 0
call random
.endw
mov bx,rand
mov arr[si],bx
mov a310,0
mov a313,0
ret
fill endp

;this function gets second box coordinates
swap proc

mov da1,0
mov da2,0
mov da3,0
mov da4,0
mov da5,0
mov da6,0
mov da8,0
mov da9,0
mov a110,0
mov a111,0
mov a112,0
mov a113,0
mov a114,0
mov a115,0
mov a117,0
mov a118,0
mov a88,0
mov a99,0
mov a316,1
mov  bx,0

;call delay


mov ax,05
 int 33h
;call delay
.if bx==1
mov ax,03
int 33h
call range
mov si,2
sub cx,da8
sub dx,da9



mov a88,100
mov a99,50

mov count,0

.while count<7
mov count1,0
.if a118==0
.if dx==a99
mov bx,a111
mov a113,bx
add a118,1
.endif
.endif

.while count1<7
.if a115==0
.if cx==a88    
mov bx,a110
mov a112,bx
add a115,1
.endif
.endif
add a110,2
add a88,50
inc count1
.endw

mov a88,100
add a111,2

add a99, 50

inc count
.endw

mov dx,0
mov ax,0
mov bx,7
mov ax,a113
mul bx

;add a112,1
add ax,a112
mov a117,ax


mov ah,02h
mov bx,0
mov dh,16 ; to move up or down
mov dl,70
int 10h

mov dx,0
mov si,a117
mov dx, a113
add dx,48
mov ah,02h
int 21h



.endif

ret
swap endp
; this function is making or populating board
populateboard proc

mov ah,0
mov al,12h;new window
int 10h
mov si,0


mov ah,02h
mov bx,0
mov dh,5 ; x axix
mov dl,60
int 10h


mov dx, offset score
mov ah,09h
int 21h

mov ah,02h
mov bx,0
mov dh,5 ; x axix
mov dl,70
int 10h


mov dx, di1
add dx,48
mov ah,02h
int 21h




mov ah,02h
mov bx,0
mov dh,3 ; to move up or down
mov dl,60
int 10h

mov dx, offset username
mov ah,09h
int 21h



mov col_inc,100 ;first block intialistaion
mov row_inc,50  ;first block  initiliasation
 mov count,0 ;number of boxes in a row
 
 mov ah,0ch
mov al,0fh

mov cx,col_inc
mov dx,row_inc


mov count,0
.while count<7

mov count1,0

.while count1<7

mov cx,col_inc
mov dx,row_inc
mov a1,0
mov a2,0
mov ah,0ch
mov al,0fh			;resetting
call vertical_22;vertical
call horizontal_33;horizontal




.if arr[si] == 1;SQUARE

mov ah,0ch
mov al,04h
mov cx,col_inc
mov dx,row_inc

add col_inc,10
add row_inc,10
mov cx,col_inc
mov dx,row_inc
mov a1,0
mov a2,0			;resetting
call vertical_221;vertical
call horizontal_331;horizontal
mov cx,col_inc
mov dx,row_inc

sub col_inc,10
sub row_inc,10

.elseif arr[si]==2;TRIANGLE


mov ah,0ch
mov al,03h
mov cx,col_inc
mov dx,row_inc

add col_inc,20
add row_inc,25
mov cx,col_inc ;column
mov dx,row_inc ; row
mov a1,0
mov a2,0
mov a3,0
call digonals_t
mov cx,col_inc
mov dx,row_inc

sub col_inc,20
sub row_inc,25

.elseif arr[si]==3;DIAGONAL


mov a1,0
mov a2,0
mov a3,0
mov ah,0ch
mov al,02h
mov cx,col_inc
mov dx,row_inc


add row_inc,20
add col_inc,35
mov cx,col_inc ;column
mov dx,row_inc ; row
call digonals_t1
mov cx,col_inc
mov dx,row_inc

sub row_inc,20
sub col_inc,35

.elseif arr[si]==4;CROSS

mov a1,0
mov a2,0
mov a3,0
mov ah,0ch
mov al,05h
mov cx,col_inc
mov dx,row_inc

add row_inc,10
add col_inc,40

mov cx,col_inc ;column
mov dx,row_inc ; row5c
call digonals_tL ;left diagnol
sub col_inc,30
mov cx,col_inc
mov dx,row_inc
add cx,30
mov a1,cx
sub cx,30
add dx,30
mov a3,dx
sub dx,30
call digonals_tR
mov cx,col_inc
mov dx,row_inc

sub row_inc,10
sub col_inc,10

.elseif arr[si]==5;HAT


mov a1,0
mov a2,0
mov a3,0
mov ah,0ch
mov al,06h
mov cx,col_inc
mov dx,row_inc


add row_inc,20
add col_inc,25
mov cx,col_inc ;column
mov dx,row_inc ; row
add cx,20
mov a1,cx
sub cx,20
add dx,20
mov a3,dx
sub dx,20
call digonals_t3
mov cx,col_inc
mov dx,row_inc
add cx,20
mov a1,cx
sub cx,20
add dx,20
mov a3,dx
sub dx,20
call digonals_tR
mov cx,col_inc
mov dx,row_inc

sub row_inc,20
sub col_inc,25

.elseif arr[si]==6;BOMB

mov ah,0ch
mov al,0Eh
mov cx,col_inc
mov dx,row_inc


add row_inc,5
add col_inc,30
mov cx,col_inc
mov dx,row_inc
call bomb2
mov cx,col_inc
mov dx,row_inc

sub row_inc,5
sub col_inc,30
.endif

add si,2
add col_inc,50
;mov rand,0
inc count1
.endw

mov col_inc,100
add row_inc,50
;add si,2
inc count
.endw


mov ax,01
int 33h

ret
populateboard endp



; this function sets the coordinates to top left most of the coordinate
range proc uses cx dx

mov da7,dx
mov dx,0
mov ax,cx
mov bx,50
div bx
mov da8,dx
mov dx,0
mov ax,da7
mov bx,50
div bx
mov da9,dx

ret 
range endp

; this function generates random number
random proc
    mov     ax, 25173          ; LCG Multiplier
    mul     word ptr SEED     ; DX:AX = LCG multiplier * seed
    add     ax, 13849          ; Add LCG increment value
    ; Modulo 65536, AX = (multiplier*seed+increment) mod 65536
    mov     SEED, ax          ; Update seed = return value
	xor dx,dx
	mov cx,7
	div cx
	mov rand,dx
    ret
random endp

; this function is for delay
Delay proc

push ax
push bx
push cx
push dx

mov cx,3000
D1:
mov bx,2000; Delay factor 
D2:
dec bx
jnz D2
loop D1

pop dx
pop cx
pop bx
pop ax

ret

Delay endp

; from here onwards all the functions are basically making candies

vertical_22 proc uses cx dx
go4:
add dx,50
mov a1,dx
sub dx,50
inc a2
call bmb_vrt
add cx ,50
cmp a2,2
je exit14
jmp go4
exit14:

ret
vertical_22 endp


horizontal_33 proc uses cx dx
go5:
add cx,50
mov a1,cx
sub cx,50
call bmb_hrzt
inc a2
add dx ,50
cmp a2,4
je exit11
jmp go5
exit11:
ret
horizontal_33 endp

vertical_221 proc uses cx dx
go4:
add dx,30
mov a1,dx
sub dx,30
inc a2
call bmb_vrt
add cx ,30
cmp a2,2
je exit14
jmp go4
exit14:

ret
vertical_221 endp


horizontal_331 proc uses cx dx
go5:
add cx,30
mov a1,cx
sub cx,30
call bmb_hrzt
inc a2
add dx ,30
cmp a2,4
je exit11
jmp go5
exit11:
ret
horizontal_331 endp



bmb_vrt proc uses cx dx
go32:
int 10h
inc dx
cmp dx,a1
je exit32 
jmp go32
exit32:
 ret
 bmb_vrt endp


bmb_hrzt proc uses cx dx
go2:
int 10h
inc cx
cmp cx,a1
je exit31 
jmp go2 
exit31:
 ret
 bmb_hrzt endp

digonals_t proc uses cx dx
go44:
sub cx,15
mov a1,cx
add cx,15
add dx,20
mov a3,dx
sub dx,20
call digonals_t3
add cx,15
mov a1,cx
sub cx,15
add dx,20
mov a3,dx
sub dx,20
call right_d
add dx,20
add cx,15
mov a1,cx
sub cx,30
call horzt_1
ret
digonals_t endp

dani333 proc uses cx dx
go55:
add cx,20
mov a1,cx
sub cx,20
call horizontal
inc a2
add dx ,20
cmp a2,4
je exit11
jmp go55
exit11:
ret
dani333 endp

digonals_t3 proc uses cx dx
go311:
int 10h
inc dx
dec cx
cmp dx,a3
je exit311 
jmp go311
exit311:
 ret
 digonals_t3 endp


right_d proc uses cx dx
go211:
int 10h
inc cx
inc dx
cmp dx,a3
je exit313 
jmp go211 
exit313:
 ret
 right_d endp


horzt_1 proc uses cx dx
go2:
int 10h
inc cx
cmp cx,a1
je exit322 
jmp go2 
exit322:
 ret
 horzt_1 endp


 digonals_t1 proc uses cx dx
sub cx,15
mov a1,cx
add cx,15
add dx,20
mov a3,dx
sub dx,20
call digonals_t3
ret
 digonals_t1 endp

 left_dgnl proc uses cx dx
go3111:
int 10h
inc dx
dec cx
cmp dx,a3
je exit3111 
jmp go3111
exit3111:
 ret
 left_dgnl endp

  digonals_tL proc uses cx dx
sub cx,30
mov a1,cx
add cx,30
add dx,30
mov a3,dx
sub dx,30
call digonals_t3


ret
 digonals_tL endp

 left_dgnl2 proc uses cx dx
go3111:
int 10h
inc dx
dec cx
cmp dx,a3
je exit31111 
jmp go3111
exit31111:
 ret
 left_dgnl2 endp

 digonals_tR proc uses cx dx
go2111:
int 10h
inc cx
inc dx
cmp dx,a3
je exit313 
jmp go2111 
exit313:
 ret
 digonals_tR endp


 ;bomb functions
 

bomb2 proc uses cx dx
go4:
sub cx,15
mov a1,cx
mov a4,cx
add cx,15
add dx,20
mov a3,dx
mov a5,dx
sub dx,20
call bomb1

add cx,15
mov a1,cx
sub cx,15
add dx,20
mov a3,dx
sub dx,20
call bomb
mov cx,a1
mov dx,a3

sub cx,15
mov a1,cx
;mov a4,cx
add cx,15
add dx,20
mov a3,dx
;mov a5,dx
sub dx,20
call bomb1

mov cx,a4
mov dx,a5
add cx,15
mov a1,cx
sub cx,15
add dx,20
mov a3,dx
sub dx,20
call bomb

add dx,20
add cx,15
mov a1,cx
sub cx,30
call bomb11
;exit1
ret
bomb2 endp









bomb1 proc uses cx dx
go3:
int 10h
inc dx
dec cx
cmp dx,a3
je exit3 
jmp go3
exit3:
 ret
 bomb1 endp


bomb proc uses cx dx
go2:
int 10h
inc cx
inc dx
cmp dx,a3
je exit31 
jmp go2 
exit31:
 ret
 bomb endp


bomb11 proc uses cx dx
go2:
int 10h
inc cx
cmp cx,a1
je exit32 
jmp go2 
exit32:
 ret
 bomb11 endp

horizontal proc uses cx dx
go2:
int 10h
inc cx
cmp cx,450
je exit3 
jmp go2 
exit3:
 ret
 horizontal endp


exit:


mov ah,3dh
mov dx,offset fname
mov al, 2  ;access code: 0 open for reading; 1 open for writing;2 for both
int 21h
mov handle, ax

MOV AH,42H; move file pointer function
MOV BX,HANDLE; Bx holds the handle which tells in which file we have to write
XOR CX,CX; Movig 0 bytes to CX
XOR DX,DX; Movig 0 bytes to DX
MOV AL, 2; Movement Code: 0 means move relative to beginning of file
; 1 means move relative to the current Pointer location
;2 means move relative to the end of file;
INT 21H


mov ax, di1
pushing:
mov dx,0
mov bx,10
div bx
push dx

inc dcount
cmp ax, 0
jne pushing

disp:
cmp dcount,0
je close
dec dcount
pop bx
add bx, 48
mov temp, bx

mov ah,40h
mov bx,handle
mov cx, 1
mov dx, offset temp
int 21h

jmp disp


; closing file
close:
mov ah,3eh
mov bx,handle
int 21h


; thats it i hope you like our code and you understand it perfectly

mov ah,4ch
int 21h
end