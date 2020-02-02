;Project OSM-BASIC
;OSM-BASIC Version 1.0
;VERSION 1.0(Beta)
;FILENAME Kernel.SYS
;未完成なカーネル、。
;Copyright(C) @Midi_dayo 2003-2020
;デバッグで疲れたらショタの画像を見て癒されるのが一番です、、(は?

BITS 16;ビット数を書く

ORG 0000h;このプログラムがどこに組み込まれるのか。

section .text;なんか書いとく、


Kernel_Start:
;ここにコードを書く。けど、また今度、めんどくさい、（おいこら



Kernel_IO_HLT_Main:

HLT

JMP Kernel_IO_HLT_Main




section .datas
ver1 db "Copyright(C) @Midi_Dayo 2003-2020",0x0D,0x0A,0x00

;カーネルのソースコードより、ブートローダのソースコードが長いの草生えた。