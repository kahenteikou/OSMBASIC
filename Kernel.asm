;Project OSM-BASIC
;OSM-BASIC Version 1.0
;VERSION 1.0(Beta)
;FILENAME Kernel.SYS
;�������ȃJ�[�l���A�B
;Copyright(C) @Midi_dayo 2003-2020
;�f�o�b�O�Ŕ�ꂽ��V���^�̉摜�����Ė������̂���Ԃł��A�A(��?

BITS 16;�r�b�g��������

ORG 0000h;���̃v���O�������ǂ��ɑg�ݍ��܂��̂��B

section .text;�Ȃ񂩏����Ƃ��A


Kernel_Start:
;�����ɃR�[�h�������B���ǁA�܂����x�A�߂�ǂ������A�i��������



Kernel_IO_HLT_Main:

HLT

JMP Kernel_IO_HLT_Main




section .datas
ver1 db "Copyright(C) @Midi_Dayo 2003-2020",0x0D,0x0A,0x00

;�J�[�l���̃\�[�X�R�[�h���A�u�[�g���[�_�̃\�[�X�R�[�h�������̑��������B