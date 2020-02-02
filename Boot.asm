;Project OSM-BASIC
;OSM-BASIC Version 1.0
;VERSION 1.0(Beta)
;FILENAME OSM.SYS
;�������ȃu�[�g���[�_�ł��B
;Copyright(C) @Midi_Dayo 2003-2020

BITS 16;�r�b�g��������

ORG 0000h;���̃v���O�������ǂ��ɑg�ݍ��܂��̂��B
section .text;�Ȃ񂩏����Ƃ��A
;�u�[�g�Z�N�^�̂��߂̋L�q�B(FAT12)
JMP Start;�u�[�g�X�g���b�v����

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

MOV AL,01h;�Z�N�^��

MOV CH,00h

;CL,00h;�Z�N�^�̈ʒu�B

;DH,00h;�w�b�h�ԍ����w�肷��A���w�b�h��0�n�܂�ł���B

MOV DL,00h;�t���b�s�[���f�B�A�Ȃ̂�00h���w��B



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

;�Z�N�^��ǂݎ��O�Ƀf�B�X�N�����Z�b�g����!�A�������Ȃ��Ɛ���ɓǂݎ��Ȃ�
;�Z�N�^�ǂݎ��͂ł��邪�ǂݎ��f�[�^���Ȃ������A�ꕔ�������B
MOV AH,00

MOV DL,00h

INT 13H

RET

JMP Read_Disk

Err_HLT:

HLT

JMP Err_HLT

section .data

;�ςȕ������\�����ꂽ��󔒂����B

sec_read_err db 'A Disk Read Error.',0x0D,0x0A,0x00

read_retry dw 'Failed at INT 13H.',0x0D,0x0A,0x00

disk_read_err db 'A Disk Reset Error.',0x0D,0x0A,0x00

start db 'Starting OS/M-BASIC...',0x0D,0x0A,0x00

TIMES 0x7dfe-($-$$) db 0

BS_BootSigin db 0xAA55;�L���ȃu�[�g���[�_�ł��邱�Ƃ��Ӗ�����V�O�l�`��