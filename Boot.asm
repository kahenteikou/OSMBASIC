;Project OSM-BASIC
;OSM-BASIC Version 1.0
;VERSION 1.0(Beta)
;FILENAME OSM.SYS
;未完成なブートローダです。
;Copyright(C) @Midi_Dayo 2003-2020

BITS 16;ビット数を書く

ORG 0000h;このプログラムがどこに組み込まれるのか。
section .text;なんか書いとく、
;ブートセクタのための記述。(FAT12)
JMP Start;ブートストラップ命令

BS_OEMName db "OSM"

BPB_BytsPerSec dw 512

BPB_SecPerClus db 0x001

BPB_RsvSecCnt db 0x0001

BPB_NumFATs   db 0x02

BPB_RootEntCnt dw 224

BPB_TotSec16 dw 0x0820

BEP_Media DB 0xF0

BPB_FATSz16 dw 9

BPB_SecPerTrk dw 18

BPB_NumHeads dw 2

BPB_HiddSec DD  0

BPB_TosSec32 db 2880

BS_DrvNum dw 0x00

BS_BootSig db 0,0,0x29

BS_VolID db 0xFFFFFFFF

BS_VolLab db "OSMBASIC"

BS_FilSysTYpe db "FAT12	"

Start:

Read_Disk:

MOV AX,0x1000

MOV ES,AX

XOR BX,BX

MOV AH,02h

MOV AL,01h;セクタ数

MOV CH,00h

;CL,00h;セクタの位置。

;DH,00h;ヘッド番号を指定する、がヘッドは0始まりである。

MOV DL,00h;フロッピーメディアなので00hを指定。



INT 13H

JC read_err

load:
MOV AH,02h

MOV AL,1

XOR BX,BX

MOV DL,00h

INT 13h
disk_

MOV AH,0Eh

MOV AL,'.'
INT 10H

XOR AX,AX

ADD CL,1

CMP CL,18

JBE load

ADD DH,1

CMP DH,2

JB load

ADD CH,1

CMP CH,10

JB load

main:

JMP 0x5200:0

read_err:

MOV AX,07C0h

MOV ES,AX

MOV AH,13h

MOV AL,001h

MOV BH,000h

MOV BL,9H

MOV CH,000H

MOV CL,Ah

MOV DH,9H

MOV DL,000H

MOV BP,sec_read_err

INT 10h

JMP Err_HLT

Reset:

;セクタを読み取る前にディスクをリセットする!、そうしないと正常に読み取れない
;セクタ読み取りはできるが読み取るデータがないうえ、一部未完成。
MOV AH,00

MOV DL,00h

INT 13H

RET

JMP Read_Disk

Err_HLT:

HLT

JMP Err_HLT

section .data

;変な文字が表示されたら空白を作る。

sec_read_err db 'A Disk Read Error.',0x0D,0x0A,0x00

read_retry dw 'Failed at INT 13H.',0x0D,0x0A,0x00

disk_read_err db 'A Disk Reset Error.',0x0D,0x0A,0x00

start db 'Starting OS/M-BASIC...',0x0D,0x0A,0x00

TIMES 0x7dfe-($-$$) db 0

BS_BootSigin db 0xAA55;有効なブートローダであることを意味するシグネチャ