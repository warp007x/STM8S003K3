   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
 111                     ; 23  unsigned int ADC_Read(ADC_CHANNEL_TypeDef ADC_Channel_Number)
 111                     ; 24  {
 113                     	switch	.text
 114  0000               _ADC_Read:
 116  0000 88            	push	a
 117  0001 89            	pushw	x
 118       00000002      OFST:	set	2
 121                     ; 25    unsigned int result = 0;
 123                     ; 27 	 ADC1_DeInit();
 125  0002 cd0000        	call	_ADC1_DeInit
 127                     ; 29 	 ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, 
 127                     ; 30              ADC_Channel_Number,
 127                     ; 31              ADC1_PRESSEL_FCPU_D18, 
 127                     ; 32              ADC1_EXTTRIG_TIM, 
 127                     ; 33              DISABLE, 
 127                     ; 34              ADC1_ALIGN_RIGHT, 
 127                     ; 35              ADC1_SCHMITTTRIG_ALL, 
 127                     ; 36              DISABLE);
 129  0005 4b00          	push	#0
 130  0007 4bff          	push	#255
 131  0009 4b08          	push	#8
 132  000b 4b00          	push	#0
 133  000d 4b00          	push	#0
 134  000f 4b70          	push	#112
 135  0011 7b09          	ld	a,(OFST+7,sp)
 136  0013 ae0100        	ldw	x,#256
 137  0016 97            	ld	xl,a
 138  0017 cd0000        	call	_ADC1_Init
 140  001a 5b06          	addw	sp,#6
 141                     ; 38    ADC1_Cmd(ENABLE);
 143  001c a601          	ld	a,#1
 144  001e cd0000        	call	_ADC1_Cmd
 146                     ; 41 	ADC1_StartConversion();
 148  0021 cd0000        	call	_ADC1_StartConversion
 151  0024               L35:
 152                     ; 42 	while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == FALSE);
 154  0024 a680          	ld	a,#128
 155  0026 cd0000        	call	_ADC1_GetFlagStatus
 157  0029 4d            	tnz	a
 158  002a 27f8          	jreq	L35
 159                     ; 44   result = ADC1_GetConversionValue();
 161  002c cd0000        	call	_ADC1_GetConversionValue
 163  002f 1f01          	ldw	(OFST-1,sp),x
 165                     ; 45   ADC1_ClearFlag(ADC1_FLAG_EOC);
 167  0031 a680          	ld	a,#128
 168  0033 cd0000        	call	_ADC1_ClearFlag
 170                     ; 47 	ADC1_DeInit();
 172  0036 cd0000        	call	_ADC1_DeInit
 174                     ; 49 	return result; 
 176  0039 1e01          	ldw	x,(OFST-1,sp)
 179  003b 5b03          	addw	sp,#3
 180  003d 81            	ret
 193                     	bsct
 194  0000               _ADC_value_1:
 195  0000 0000          	dc.w	0
 196  0002               _n:
 197  0002 0004          	dc.w	4
 256                     ; 26 void delay(int ms){
 257                     	switch	.text
 258  003e               _delay:
 260  003e 89            	pushw	x
 261  003f 5204          	subw	sp,#4
 262       00000004      OFST:	set	4
 265                     ; 27 	int i=0, j=0;
 269                     ; 28 	for(i=0; i<=ms; i++){
 271  0041 5f            	clrw	x
 272  0042 1f01          	ldw	(OFST-3,sp),x
 275  0044 201a          	jra	L711
 276  0046               L311:
 277                     ; 29 		for(j=0; j<120; j++){
 279  0046 5f            	clrw	x
 280  0047 1f03          	ldw	(OFST-1,sp),x
 282  0049               L321:
 283                     ; 30 			_asm("nop");
 286  0049 9d            nop
 288                     ; 29 		for(j=0; j<120; j++){
 290  004a 1e03          	ldw	x,(OFST-1,sp)
 291  004c 1c0001        	addw	x,#1
 292  004f 1f03          	ldw	(OFST-1,sp),x
 296  0051 9c            	rvf
 297  0052 1e03          	ldw	x,(OFST-1,sp)
 298  0054 a30078        	cpw	x,#120
 299  0057 2ff0          	jrslt	L321
 300                     ; 28 	for(i=0; i<=ms; i++){
 302  0059 1e01          	ldw	x,(OFST-3,sp)
 303  005b 1c0001        	addw	x,#1
 304  005e 1f01          	ldw	(OFST-3,sp),x
 306  0060               L711:
 309  0060 9c            	rvf
 310  0061 1e01          	ldw	x,(OFST-3,sp)
 311  0063 1305          	cpw	x,(OFST+1,sp)
 312  0065 2ddf          	jrsle	L311
 313                     ; 33 }
 316  0067 5b06          	addw	sp,#6
 317  0069 81            	ret
 350                     ; 37 void main()
 350                     ; 38 {
 351                     	switch	.text
 352  006a               _main:
 356                     ; 39 	GPIO_DeInit(GPIOA);
 358  006a ae5000        	ldw	x,#20480
 359  006d cd0000        	call	_GPIO_DeInit
 361                     ; 40 	GPIO_DeInit(GPIOB);
 363  0070 ae5005        	ldw	x,#20485
 364  0073 cd0000        	call	_GPIO_DeInit
 366                     ; 41 	GPIO_DeInit(GPIOC);
 368  0076 ae500a        	ldw	x,#20490
 369  0079 cd0000        	call	_GPIO_DeInit
 371                     ; 42 	GPIO_DeInit(GPIOD);
 373  007c ae500f        	ldw	x,#20495
 374  007f cd0000        	call	_GPIO_DeInit
 376                     ; 43 	GPIO_DeInit(GPIOE);
 378  0082 ae5014        	ldw	x,#20500
 379  0085 cd0000        	call	_GPIO_DeInit
 381                     ; 44 	GPIO_DeInit(GPIOF);
 383  0088 ae5019        	ldw	x,#20505
 384  008b cd0000        	call	_GPIO_DeInit
 386                     ; 46 	GPIO_Init (GPIOB, GPIO_PIN_4, GPIO_MODE_IN_PU_IT);//increment button
 388  008e 4b60          	push	#96
 389  0090 4b10          	push	#16
 390  0092 ae5005        	ldw	x,#20485
 391  0095 cd0000        	call	_GPIO_Init
 393  0098 85            	popw	x
 394                     ; 47 	GPIO_Init (GPIOB, GPIO_PIN_5, GPIO_MODE_IN_PU_IT);//dectrement button
 396  0099 4b60          	push	#96
 397  009b 4b20          	push	#32
 398  009d ae5005        	ldw	x,#20485
 399  00a0 cd0000        	call	_GPIO_Init
 401  00a3 85            	popw	x
 402                     ; 48 	GPIO_Init (GPIOB, GPIO_PIN_6, GPIO_MODE_IN_PU_IT);//set button
 404  00a4 4b60          	push	#96
 405  00a6 4b40          	push	#64
 406  00a8 ae5005        	ldw	x,#20485
 407  00ab cd0000        	call	_GPIO_Init
 409  00ae 85            	popw	x
 410                     ; 51 	GPIO_Init (GPIOB, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 412  00af 4be0          	push	#224
 413  00b1 4b08          	push	#8
 414  00b3 ae5005        	ldw	x,#20485
 415  00b6 cd0000        	call	_GPIO_Init
 417  00b9 85            	popw	x
 418                     ; 53 	GPIO_Init (A0_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
 420  00ba 4bd0          	push	#208
 421  00bc 4b20          	push	#32
 422  00be ae5014        	ldw	x,#20500
 423  00c1 cd0000        	call	_GPIO_Init
 425  00c4 85            	popw	x
 426                     ; 54 	GPIO_Init (B0_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
 428  00c5 4bd0          	push	#208
 429  00c7 4b02          	push	#2
 430  00c9 ae500a        	ldw	x,#20490
 431  00cc cd0000        	call	_GPIO_Init
 433  00cf 85            	popw	x
 434                     ; 55 	GPIO_Init (C0_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
 436  00d0 4bd0          	push	#208
 437  00d2 4b04          	push	#4
 438  00d4 ae500a        	ldw	x,#20490
 439  00d7 cd0000        	call	_GPIO_Init
 441  00da 85            	popw	x
 442                     ; 56 	GPIO_Init (D0_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
 444  00db 4bd0          	push	#208
 445  00dd 4b08          	push	#8
 446  00df ae500a        	ldw	x,#20490
 447  00e2 cd0000        	call	_GPIO_Init
 449  00e5 85            	popw	x
 450                     ; 57 	GPIO_Init (E0_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
 452  00e6 4bd0          	push	#208
 453  00e8 4b10          	push	#16
 454  00ea ae500a        	ldw	x,#20490
 455  00ed cd0000        	call	_GPIO_Init
 457  00f0 85            	popw	x
 458                     ; 58 	GPIO_Init (F0_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
 460  00f1 4bd0          	push	#208
 461  00f3 4b20          	push	#32
 462  00f5 ae500a        	ldw	x,#20490
 463  00f8 cd0000        	call	_GPIO_Init
 465  00fb 85            	popw	x
 466                     ; 59 	GPIO_Init (G0_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
 468  00fc 4bd0          	push	#208
 469  00fe 4b40          	push	#64
 470  0100 ae500a        	ldw	x,#20490
 471  0103 cd0000        	call	_GPIO_Init
 473  0106 85            	popw	x
 474                     ; 60 	GPIO_Init (DP0_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
 476  0107 4bd0          	push	#208
 477  0109 4b80          	push	#128
 478  010b ae500a        	ldw	x,#20490
 479  010e cd0000        	call	_GPIO_Init
 481  0111 85            	popw	x
 482                     ; 61 	GPIO_Init (A1_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
 484  0112 4bd0          	push	#208
 485  0114 4b01          	push	#1
 486  0116 ae500f        	ldw	x,#20495
 487  0119 cd0000        	call	_GPIO_Init
 489  011c 85            	popw	x
 490                     ; 62 	GPIO_Init (B1_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
 492  011d 4bd0          	push	#208
 493  011f 4b02          	push	#2
 494  0121 ae500f        	ldw	x,#20495
 495  0124 cd0000        	call	_GPIO_Init
 497  0127 85            	popw	x
 498                     ; 63 	GPIO_Init (C1_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
 500  0128 4bd0          	push	#208
 501  012a 4b04          	push	#4
 502  012c ae500f        	ldw	x,#20495
 503  012f cd0000        	call	_GPIO_Init
 505  0132 85            	popw	x
 506                     ; 64 	GPIO_Init (D1_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
 508  0133 4bd0          	push	#208
 509  0135 4b08          	push	#8
 510  0137 ae500f        	ldw	x,#20495
 511  013a cd0000        	call	_GPIO_Init
 513  013d 85            	popw	x
 514                     ; 65 	GPIO_Init (E1_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
 516  013e 4bd0          	push	#208
 517  0140 4b10          	push	#16
 518  0142 ae500f        	ldw	x,#20495
 519  0145 cd0000        	call	_GPIO_Init
 521  0148 85            	popw	x
 522                     ; 66 	GPIO_Init (F1_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
 524  0149 4bd0          	push	#208
 525  014b 4b20          	push	#32
 526  014d ae500f        	ldw	x,#20495
 527  0150 cd0000        	call	_GPIO_Init
 529  0153 85            	popw	x
 530                     ; 67 	GPIO_Init (G1_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
 532  0154 4bd0          	push	#208
 533  0156 4b40          	push	#64
 534  0158 ae500f        	ldw	x,#20495
 535  015b cd0000        	call	_GPIO_Init
 537  015e 85            	popw	x
 538                     ; 68 	GPIO_Init (DP1_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
 540  015f 4bd0          	push	#208
 541  0161 4b80          	push	#128
 542  0163 ae500f        	ldw	x,#20495
 543  0166 cd0000        	call	_GPIO_Init
 545  0169 85            	popw	x
 546                     ; 70 	ADC_value_1 = ADC_Read (AIN2);
 548  016a a602          	ld	a,#2
 549  016c cd0000        	call	_ADC_Read
 551  016f bf00          	ldw	_ADC_value_1,x
 552  0171               L141:
 553                     ; 74 		if (GPIO_ReadInputPin(GPIOB, GPIO_PIN_4))
 555  0171 4b10          	push	#16
 556  0173 ae5005        	ldw	x,#20485
 557  0176 cd0000        	call	_GPIO_ReadInputPin
 559  0179 5b01          	addw	sp,#1
 560  017b 4d            	tnz	a
 561  017c 2707          	jreq	L541
 562                     ; 75 			n++;
 564  017e be02          	ldw	x,_n
 565  0180 1c0001        	addw	x,#1
 566  0183 bf02          	ldw	_n,x
 567  0185               L541:
 568                     ; 76 		if (GPIO_ReadInputPin(GPIOB, GPIO_PIN_5))
 570  0185 4b20          	push	#32
 571  0187 ae5005        	ldw	x,#20485
 572  018a cd0000        	call	_GPIO_ReadInputPin
 574  018d 5b01          	addw	sp,#1
 575  018f 4d            	tnz	a
 576  0190 2707          	jreq	L741
 577                     ; 77 			n--;
 579  0192 be02          	ldw	x,_n
 580  0194 1d0001        	subw	x,#1
 581  0197 bf02          	ldw	_n,x
 582  0199               L741:
 583                     ; 78 		if (GPIO_ReadInputPin(GPIOB, GPIO_PIN_6))
 585  0199 4b40          	push	#64
 586  019b ae5005        	ldw	x,#20485
 587  019e cd0000        	call	_GPIO_ReadInputPin
 589  01a1 5b01          	addw	sp,#1
 590  01a3 4d            	tnz	a
 591  01a4 2738          	jreq	L151
 593  01a6 201c          	jra	L551
 594  01a8               L351:
 595                     ; 82 				printDigit(n--);
 597  01a8 be02          	ldw	x,_n
 598  01aa 1d0001        	subw	x,#1
 599  01ad bf02          	ldw	_n,x
 600  01af 1c0001        	addw	x,#1
 601  01b2 cd07b3        	call	_printDigit
 603                     ; 83 				GPIO_WriteHigh(GPIOB,GPIO_PIN_3);
 605  01b5 4b08          	push	#8
 606  01b7 ae5005        	ldw	x,#20485
 607  01ba cd0000        	call	_GPIO_WriteHigh
 609  01bd 84            	pop	a
 610                     ; 84 				delay(1000);
 612  01be ae03e8        	ldw	x,#1000
 613  01c1 cd003e        	call	_delay
 615  01c4               L551:
 616                     ; 80 				while(n!=-1){
 618  01c4 be02          	ldw	x,_n
 619  01c6 a3ffff        	cpw	x,#65535
 620  01c9 26dd          	jrne	L351
 621                     ; 86 				if(n==-1){
 623  01cb be02          	ldw	x,_n
 624  01cd a3ffff        	cpw	x,#65535
 625  01d0 260c          	jrne	L151
 626                     ; 87 					GPIO_WriteLow(GPIOB,GPIO_PIN_3);
 628  01d2 4b08          	push	#8
 629  01d4 ae5005        	ldw	x,#20485
 630  01d7 cd0000        	call	_GPIO_WriteLow
 632  01da 84            	pop	a
 633                     ; 88 					n=0;
 635  01db 5f            	clrw	x
 636  01dc bf02          	ldw	_n,x
 637  01de               L151:
 638                     ; 92 		if(ADC_value_1>0){
 640  01de be00          	ldw	x,_ADC_value_1
 641  01e0 270b          	jreq	L361
 642                     ; 93 			GPIO_WriteHigh(GPIOB,GPIO_PIN_3);
 644  01e2 4b08          	push	#8
 645  01e4 ae5005        	ldw	x,#20485
 646  01e7 cd0000        	call	_GPIO_WriteHigh
 648  01ea 84            	pop	a
 650  01eb 2009          	jra	L561
 651  01ed               L361:
 652                     ; 95 		else GPIO_WriteLow(GPIOB,GPIO_PIN_3);
 654  01ed 4b08          	push	#8
 655  01ef ae5005        	ldw	x,#20485
 656  01f2 cd0000        	call	_GPIO_WriteLow
 658  01f5 84            	pop	a
 659  01f6               L561:
 660                     ; 97 			delay(300);
 662  01f6 ae012c        	ldw	x,#300
 663  01f9 cd003e        	call	_delay
 666  01fc cc0171        	jra	L141
 691                     ; 101 void Azero(void) {
 692                     	switch	.text
 693  01ff               _Azero:
 697                     ; 102   GPIO_WriteLow(A0_7seg);
 699  01ff 4b20          	push	#32
 700  0201 ae5014        	ldw	x,#20500
 701  0204 cd0000        	call	_GPIO_WriteLow
 703  0207 84            	pop	a
 704                     ; 103 	GPIO_WriteLow(B0_7seg);
 706  0208 4b02          	push	#2
 707  020a ae500a        	ldw	x,#20490
 708  020d cd0000        	call	_GPIO_WriteLow
 710  0210 84            	pop	a
 711                     ; 104 	GPIO_WriteLow(C0_7seg);
 713  0211 4b04          	push	#4
 714  0213 ae500a        	ldw	x,#20490
 715  0216 cd0000        	call	_GPIO_WriteLow
 717  0219 84            	pop	a
 718                     ; 105 	GPIO_WriteLow(D0_7seg);
 720  021a 4b08          	push	#8
 721  021c ae500a        	ldw	x,#20490
 722  021f cd0000        	call	_GPIO_WriteLow
 724  0222 84            	pop	a
 725                     ; 106 	GPIO_WriteLow(E0_7seg);
 727  0223 4b10          	push	#16
 728  0225 ae500a        	ldw	x,#20490
 729  0228 cd0000        	call	_GPIO_WriteLow
 731  022b 84            	pop	a
 732                     ; 107 	GPIO_WriteLow(F0_7seg);
 734  022c 4b20          	push	#32
 735  022e ae500a        	ldw	x,#20490
 736  0231 cd0000        	call	_GPIO_WriteLow
 738  0234 84            	pop	a
 739                     ; 108 	GPIO_WriteHigh(G0_7seg);
 741  0235 4b40          	push	#64
 742  0237 ae500a        	ldw	x,#20490
 743  023a cd0000        	call	_GPIO_WriteHigh
 745  023d 84            	pop	a
 746                     ; 109 	GPIO_WriteLow(DP0_7seg);
 748  023e 4b80          	push	#128
 749  0240 ae500a        	ldw	x,#20490
 750  0243 cd0000        	call	_GPIO_WriteLow
 752  0246 84            	pop	a
 753                     ; 110 }
 756  0247 81            	ret
 781                     ; 112 void Aone(void) {
 782                     	switch	.text
 783  0248               _Aone:
 787                     ; 113   GPIO_WriteHigh(A0_7seg);
 789  0248 4b20          	push	#32
 790  024a ae5014        	ldw	x,#20500
 791  024d cd0000        	call	_GPIO_WriteHigh
 793  0250 84            	pop	a
 794                     ; 114 	GPIO_WriteLow(B0_7seg);
 796  0251 4b02          	push	#2
 797  0253 ae500a        	ldw	x,#20490
 798  0256 cd0000        	call	_GPIO_WriteLow
 800  0259 84            	pop	a
 801                     ; 115 	GPIO_WriteLow(C0_7seg);
 803  025a 4b04          	push	#4
 804  025c ae500a        	ldw	x,#20490
 805  025f cd0000        	call	_GPIO_WriteLow
 807  0262 84            	pop	a
 808                     ; 116 	GPIO_WriteHigh(D0_7seg);
 810  0263 4b08          	push	#8
 811  0265 ae500a        	ldw	x,#20490
 812  0268 cd0000        	call	_GPIO_WriteHigh
 814  026b 84            	pop	a
 815                     ; 117 	GPIO_WriteHigh(E0_7seg);
 817  026c 4b10          	push	#16
 818  026e ae500a        	ldw	x,#20490
 819  0271 cd0000        	call	_GPIO_WriteHigh
 821  0274 84            	pop	a
 822                     ; 118 	GPIO_WriteHigh(F0_7seg);
 824  0275 4b20          	push	#32
 825  0277 ae500a        	ldw	x,#20490
 826  027a cd0000        	call	_GPIO_WriteHigh
 828  027d 84            	pop	a
 829                     ; 119 	GPIO_WriteHigh(G0_7seg);
 831  027e 4b40          	push	#64
 832  0280 ae500a        	ldw	x,#20490
 833  0283 cd0000        	call	_GPIO_WriteHigh
 835  0286 84            	pop	a
 836                     ; 120 	GPIO_WriteLow(DP0_7seg);
 838  0287 4b80          	push	#128
 839  0289 ae500a        	ldw	x,#20490
 840  028c cd0000        	call	_GPIO_WriteLow
 842  028f 84            	pop	a
 843                     ; 121 }
 846  0290 81            	ret
 871                     ; 123 void Atwo(void) {
 872                     	switch	.text
 873  0291               _Atwo:
 877                     ; 124   GPIO_WriteLow(A0_7seg);
 879  0291 4b20          	push	#32
 880  0293 ae5014        	ldw	x,#20500
 881  0296 cd0000        	call	_GPIO_WriteLow
 883  0299 84            	pop	a
 884                     ; 125 	GPIO_WriteLow(B0_7seg);
 886  029a 4b02          	push	#2
 887  029c ae500a        	ldw	x,#20490
 888  029f cd0000        	call	_GPIO_WriteLow
 890  02a2 84            	pop	a
 891                     ; 126 	GPIO_WriteHigh(C0_7seg);
 893  02a3 4b04          	push	#4
 894  02a5 ae500a        	ldw	x,#20490
 895  02a8 cd0000        	call	_GPIO_WriteHigh
 897  02ab 84            	pop	a
 898                     ; 127 	GPIO_WriteLow(D0_7seg);
 900  02ac 4b08          	push	#8
 901  02ae ae500a        	ldw	x,#20490
 902  02b1 cd0000        	call	_GPIO_WriteLow
 904  02b4 84            	pop	a
 905                     ; 128 	GPIO_WriteLow(E0_7seg);
 907  02b5 4b10          	push	#16
 908  02b7 ae500a        	ldw	x,#20490
 909  02ba cd0000        	call	_GPIO_WriteLow
 911  02bd 84            	pop	a
 912                     ; 129 	GPIO_WriteHigh(F0_7seg);
 914  02be 4b20          	push	#32
 915  02c0 ae500a        	ldw	x,#20490
 916  02c3 cd0000        	call	_GPIO_WriteHigh
 918  02c6 84            	pop	a
 919                     ; 130 	GPIO_WriteLow(G0_7seg);
 921  02c7 4b40          	push	#64
 922  02c9 ae500a        	ldw	x,#20490
 923  02cc cd0000        	call	_GPIO_WriteLow
 925  02cf 84            	pop	a
 926                     ; 131 	GPIO_WriteLow(DP0_7seg);
 928  02d0 4b80          	push	#128
 929  02d2 ae500a        	ldw	x,#20490
 930  02d5 cd0000        	call	_GPIO_WriteLow
 932  02d8 84            	pop	a
 933                     ; 132 }
 936  02d9 81            	ret
 961                     ; 134 void Athree(void) {
 962                     	switch	.text
 963  02da               _Athree:
 967                     ; 135   GPIO_WriteLow(A0_7seg);
 969  02da 4b20          	push	#32
 970  02dc ae5014        	ldw	x,#20500
 971  02df cd0000        	call	_GPIO_WriteLow
 973  02e2 84            	pop	a
 974                     ; 136 	GPIO_WriteLow(B0_7seg);
 976  02e3 4b02          	push	#2
 977  02e5 ae500a        	ldw	x,#20490
 978  02e8 cd0000        	call	_GPIO_WriteLow
 980  02eb 84            	pop	a
 981                     ; 137 	GPIO_WriteLow(C0_7seg);
 983  02ec 4b04          	push	#4
 984  02ee ae500a        	ldw	x,#20490
 985  02f1 cd0000        	call	_GPIO_WriteLow
 987  02f4 84            	pop	a
 988                     ; 138 	GPIO_WriteLow(D0_7seg);
 990  02f5 4b08          	push	#8
 991  02f7 ae500a        	ldw	x,#20490
 992  02fa cd0000        	call	_GPIO_WriteLow
 994  02fd 84            	pop	a
 995                     ; 139 	GPIO_WriteHigh(E0_7seg);
 997  02fe 4b10          	push	#16
 998  0300 ae500a        	ldw	x,#20490
 999  0303 cd0000        	call	_GPIO_WriteHigh
1001  0306 84            	pop	a
1002                     ; 140 	GPIO_WriteHigh(F0_7seg);
1004  0307 4b20          	push	#32
1005  0309 ae500a        	ldw	x,#20490
1006  030c cd0000        	call	_GPIO_WriteHigh
1008  030f 84            	pop	a
1009                     ; 141 	GPIO_WriteLow(G0_7seg);
1011  0310 4b40          	push	#64
1012  0312 ae500a        	ldw	x,#20490
1013  0315 cd0000        	call	_GPIO_WriteLow
1015  0318 84            	pop	a
1016                     ; 142 	GPIO_WriteLow(DP0_7seg);
1018  0319 4b80          	push	#128
1019  031b ae500a        	ldw	x,#20490
1020  031e cd0000        	call	_GPIO_WriteLow
1022  0321 84            	pop	a
1023                     ; 143 }
1026  0322 81            	ret
1051                     ; 145 void Afour(void) {
1052                     	switch	.text
1053  0323               _Afour:
1057                     ; 146   GPIO_WriteHigh(A0_7seg);
1059  0323 4b20          	push	#32
1060  0325 ae5014        	ldw	x,#20500
1061  0328 cd0000        	call	_GPIO_WriteHigh
1063  032b 84            	pop	a
1064                     ; 147 	GPIO_WriteLow(B0_7seg);
1066  032c 4b02          	push	#2
1067  032e ae500a        	ldw	x,#20490
1068  0331 cd0000        	call	_GPIO_WriteLow
1070  0334 84            	pop	a
1071                     ; 148 	GPIO_WriteLow(C0_7seg);
1073  0335 4b04          	push	#4
1074  0337 ae500a        	ldw	x,#20490
1075  033a cd0000        	call	_GPIO_WriteLow
1077  033d 84            	pop	a
1078                     ; 149 	GPIO_WriteHigh(D0_7seg);
1080  033e 4b08          	push	#8
1081  0340 ae500a        	ldw	x,#20490
1082  0343 cd0000        	call	_GPIO_WriteHigh
1084  0346 84            	pop	a
1085                     ; 150 	GPIO_WriteHigh(E0_7seg);
1087  0347 4b10          	push	#16
1088  0349 ae500a        	ldw	x,#20490
1089  034c cd0000        	call	_GPIO_WriteHigh
1091  034f 84            	pop	a
1092                     ; 151 	GPIO_WriteLow(F0_7seg);
1094  0350 4b20          	push	#32
1095  0352 ae500a        	ldw	x,#20490
1096  0355 cd0000        	call	_GPIO_WriteLow
1098  0358 84            	pop	a
1099                     ; 152 	GPIO_WriteLow(G0_7seg);
1101  0359 4b40          	push	#64
1102  035b ae500a        	ldw	x,#20490
1103  035e cd0000        	call	_GPIO_WriteLow
1105  0361 84            	pop	a
1106                     ; 153 	GPIO_WriteLow(DP0_7seg);
1108  0362 4b80          	push	#128
1109  0364 ae500a        	ldw	x,#20490
1110  0367 cd0000        	call	_GPIO_WriteLow
1112  036a 84            	pop	a
1113                     ; 154 }
1116  036b 81            	ret
1141                     ; 156 void Afive(void) {
1142                     	switch	.text
1143  036c               _Afive:
1147                     ; 157   GPIO_WriteLow(A0_7seg);
1149  036c 4b20          	push	#32
1150  036e ae5014        	ldw	x,#20500
1151  0371 cd0000        	call	_GPIO_WriteLow
1153  0374 84            	pop	a
1154                     ; 158 	GPIO_WriteHigh(B0_7seg);
1156  0375 4b02          	push	#2
1157  0377 ae500a        	ldw	x,#20490
1158  037a cd0000        	call	_GPIO_WriteHigh
1160  037d 84            	pop	a
1161                     ; 159 	GPIO_WriteLow(C0_7seg);
1163  037e 4b04          	push	#4
1164  0380 ae500a        	ldw	x,#20490
1165  0383 cd0000        	call	_GPIO_WriteLow
1167  0386 84            	pop	a
1168                     ; 160 	GPIO_WriteLow(D0_7seg);
1170  0387 4b08          	push	#8
1171  0389 ae500a        	ldw	x,#20490
1172  038c cd0000        	call	_GPIO_WriteLow
1174  038f 84            	pop	a
1175                     ; 161 	GPIO_WriteHigh(E0_7seg);
1177  0390 4b10          	push	#16
1178  0392 ae500a        	ldw	x,#20490
1179  0395 cd0000        	call	_GPIO_WriteHigh
1181  0398 84            	pop	a
1182                     ; 162 	GPIO_WriteLow(F0_7seg);
1184  0399 4b20          	push	#32
1185  039b ae500a        	ldw	x,#20490
1186  039e cd0000        	call	_GPIO_WriteLow
1188  03a1 84            	pop	a
1189                     ; 163 	GPIO_WriteLow(G0_7seg);
1191  03a2 4b40          	push	#64
1192  03a4 ae500a        	ldw	x,#20490
1193  03a7 cd0000        	call	_GPIO_WriteLow
1195  03aa 84            	pop	a
1196                     ; 164 	GPIO_WriteLow(DP0_7seg);
1198  03ab 4b80          	push	#128
1199  03ad ae500a        	ldw	x,#20490
1200  03b0 cd0000        	call	_GPIO_WriteLow
1202  03b3 84            	pop	a
1203                     ; 165 }
1206  03b4 81            	ret
1231                     ; 167 void Asix(void) {
1232                     	switch	.text
1233  03b5               _Asix:
1237                     ; 168   GPIO_WriteLow(A0_7seg);
1239  03b5 4b20          	push	#32
1240  03b7 ae5014        	ldw	x,#20500
1241  03ba cd0000        	call	_GPIO_WriteLow
1243  03bd 84            	pop	a
1244                     ; 169 	GPIO_WriteHigh(B0_7seg);
1246  03be 4b02          	push	#2
1247  03c0 ae500a        	ldw	x,#20490
1248  03c3 cd0000        	call	_GPIO_WriteHigh
1250  03c6 84            	pop	a
1251                     ; 170 	GPIO_WriteLow(C0_7seg);
1253  03c7 4b04          	push	#4
1254  03c9 ae500a        	ldw	x,#20490
1255  03cc cd0000        	call	_GPIO_WriteLow
1257  03cf 84            	pop	a
1258                     ; 171 	GPIO_WriteLow(D0_7seg);
1260  03d0 4b08          	push	#8
1261  03d2 ae500a        	ldw	x,#20490
1262  03d5 cd0000        	call	_GPIO_WriteLow
1264  03d8 84            	pop	a
1265                     ; 172 	GPIO_WriteLow(E0_7seg);
1267  03d9 4b10          	push	#16
1268  03db ae500a        	ldw	x,#20490
1269  03de cd0000        	call	_GPIO_WriteLow
1271  03e1 84            	pop	a
1272                     ; 173 	GPIO_WriteLow(F0_7seg);
1274  03e2 4b20          	push	#32
1275  03e4 ae500a        	ldw	x,#20490
1276  03e7 cd0000        	call	_GPIO_WriteLow
1278  03ea 84            	pop	a
1279                     ; 174 	GPIO_WriteLow(G0_7seg);
1281  03eb 4b40          	push	#64
1282  03ed ae500a        	ldw	x,#20490
1283  03f0 cd0000        	call	_GPIO_WriteLow
1285  03f3 84            	pop	a
1286                     ; 175 	GPIO_WriteLow(DP0_7seg);
1288  03f4 4b80          	push	#128
1289  03f6 ae500a        	ldw	x,#20490
1290  03f9 cd0000        	call	_GPIO_WriteLow
1292  03fc 84            	pop	a
1293                     ; 176 }
1296  03fd 81            	ret
1321                     ; 178 void Aseven(void) {
1322                     	switch	.text
1323  03fe               _Aseven:
1327                     ; 179   GPIO_WriteLow(A0_7seg);
1329  03fe 4b20          	push	#32
1330  0400 ae5014        	ldw	x,#20500
1331  0403 cd0000        	call	_GPIO_WriteLow
1333  0406 84            	pop	a
1334                     ; 180 	GPIO_WriteLow(B0_7seg);
1336  0407 4b02          	push	#2
1337  0409 ae500a        	ldw	x,#20490
1338  040c cd0000        	call	_GPIO_WriteLow
1340  040f 84            	pop	a
1341                     ; 181 	GPIO_WriteLow(C0_7seg);
1343  0410 4b04          	push	#4
1344  0412 ae500a        	ldw	x,#20490
1345  0415 cd0000        	call	_GPIO_WriteLow
1347  0418 84            	pop	a
1348                     ; 182 	GPIO_WriteHigh(D0_7seg);
1350  0419 4b08          	push	#8
1351  041b ae500a        	ldw	x,#20490
1352  041e cd0000        	call	_GPIO_WriteHigh
1354  0421 84            	pop	a
1355                     ; 183 	GPIO_WriteHigh(E0_7seg);
1357  0422 4b10          	push	#16
1358  0424 ae500a        	ldw	x,#20490
1359  0427 cd0000        	call	_GPIO_WriteHigh
1361  042a 84            	pop	a
1362                     ; 184 	GPIO_WriteHigh(F0_7seg);
1364  042b 4b20          	push	#32
1365  042d ae500a        	ldw	x,#20490
1366  0430 cd0000        	call	_GPIO_WriteHigh
1368  0433 84            	pop	a
1369                     ; 185 	GPIO_WriteHigh(G0_7seg);
1371  0434 4b40          	push	#64
1372  0436 ae500a        	ldw	x,#20490
1373  0439 cd0000        	call	_GPIO_WriteHigh
1375  043c 84            	pop	a
1376                     ; 186 	GPIO_WriteLow(DP0_7seg);
1378  043d 4b80          	push	#128
1379  043f ae500a        	ldw	x,#20490
1380  0442 cd0000        	call	_GPIO_WriteLow
1382  0445 84            	pop	a
1383                     ; 187 }
1386  0446 81            	ret
1410                     ; 189 void Aeight(void) {
1411                     	switch	.text
1412  0447               _Aeight:
1416                     ; 190   GPIO_WriteLow(A0_7seg);
1418  0447 4b20          	push	#32
1419  0449 ae5014        	ldw	x,#20500
1420  044c cd0000        	call	_GPIO_WriteLow
1422  044f 84            	pop	a
1423                     ; 191 	GPIO_WriteLow(B0_7seg);
1425  0450 4b02          	push	#2
1426  0452 ae500a        	ldw	x,#20490
1427  0455 cd0000        	call	_GPIO_WriteLow
1429  0458 84            	pop	a
1430                     ; 192 	GPIO_WriteLow(C0_7seg);
1432  0459 4b04          	push	#4
1433  045b ae500a        	ldw	x,#20490
1434  045e cd0000        	call	_GPIO_WriteLow
1436  0461 84            	pop	a
1437                     ; 193 	GPIO_WriteLow(D0_7seg);
1439  0462 4b08          	push	#8
1440  0464 ae500a        	ldw	x,#20490
1441  0467 cd0000        	call	_GPIO_WriteLow
1443  046a 84            	pop	a
1444                     ; 194 	GPIO_WriteLow(E0_7seg);
1446  046b 4b10          	push	#16
1447  046d ae500a        	ldw	x,#20490
1448  0470 cd0000        	call	_GPIO_WriteLow
1450  0473 84            	pop	a
1451                     ; 195 	GPIO_WriteLow(F0_7seg);
1453  0474 4b20          	push	#32
1454  0476 ae500a        	ldw	x,#20490
1455  0479 cd0000        	call	_GPIO_WriteLow
1457  047c 84            	pop	a
1458                     ; 196 	GPIO_WriteLow(G0_7seg);
1460  047d 4b40          	push	#64
1461  047f ae500a        	ldw	x,#20490
1462  0482 cd0000        	call	_GPIO_WriteLow
1464  0485 84            	pop	a
1465                     ; 197 	GPIO_WriteLow(DP0_7seg);
1467  0486 4b80          	push	#128
1468  0488 ae500a        	ldw	x,#20490
1469  048b cd0000        	call	_GPIO_WriteLow
1471  048e 84            	pop	a
1472                     ; 198 }
1475  048f 81            	ret
1500                     ; 200 void Anine(void) {
1501                     	switch	.text
1502  0490               _Anine:
1506                     ; 201   GPIO_WriteLow(A0_7seg);
1508  0490 4b20          	push	#32
1509  0492 ae5014        	ldw	x,#20500
1510  0495 cd0000        	call	_GPIO_WriteLow
1512  0498 84            	pop	a
1513                     ; 202 	GPIO_WriteLow(B0_7seg);
1515  0499 4b02          	push	#2
1516  049b ae500a        	ldw	x,#20490
1517  049e cd0000        	call	_GPIO_WriteLow
1519  04a1 84            	pop	a
1520                     ; 203 	GPIO_WriteLow(C0_7seg);
1522  04a2 4b04          	push	#4
1523  04a4 ae500a        	ldw	x,#20490
1524  04a7 cd0000        	call	_GPIO_WriteLow
1526  04aa 84            	pop	a
1527                     ; 204 	GPIO_WriteHigh(D0_7seg);
1529  04ab 4b08          	push	#8
1530  04ad ae500a        	ldw	x,#20490
1531  04b0 cd0000        	call	_GPIO_WriteHigh
1533  04b3 84            	pop	a
1534                     ; 205 	GPIO_WriteHigh(E0_7seg);
1536  04b4 4b10          	push	#16
1537  04b6 ae500a        	ldw	x,#20490
1538  04b9 cd0000        	call	_GPIO_WriteHigh
1540  04bc 84            	pop	a
1541                     ; 206 	GPIO_WriteLow(F0_7seg);
1543  04bd 4b20          	push	#32
1544  04bf ae500a        	ldw	x,#20490
1545  04c2 cd0000        	call	_GPIO_WriteLow
1547  04c5 84            	pop	a
1548                     ; 207 	GPIO_WriteLow(G0_7seg);
1550  04c6 4b40          	push	#64
1551  04c8 ae500a        	ldw	x,#20490
1552  04cb cd0000        	call	_GPIO_WriteLow
1554  04ce 84            	pop	a
1555                     ; 208 	GPIO_WriteLow(DP0_7seg);
1557  04cf 4b80          	push	#128
1558  04d1 ae500a        	ldw	x,#20490
1559  04d4 cd0000        	call	_GPIO_WriteLow
1561  04d7 84            	pop	a
1562                     ; 209 }
1565  04d8 81            	ret
1590                     ; 211 void Bzero(void) {
1591                     	switch	.text
1592  04d9               _Bzero:
1596                     ; 212   GPIO_WriteLow(A1_7seg);
1598  04d9 4b01          	push	#1
1599  04db ae500f        	ldw	x,#20495
1600  04de cd0000        	call	_GPIO_WriteLow
1602  04e1 84            	pop	a
1603                     ; 213 	GPIO_WriteLow(B1_7seg);
1605  04e2 4b02          	push	#2
1606  04e4 ae500f        	ldw	x,#20495
1607  04e7 cd0000        	call	_GPIO_WriteLow
1609  04ea 84            	pop	a
1610                     ; 214 	GPIO_WriteLow(C1_7seg);
1612  04eb 4b04          	push	#4
1613  04ed ae500f        	ldw	x,#20495
1614  04f0 cd0000        	call	_GPIO_WriteLow
1616  04f3 84            	pop	a
1617                     ; 215 	GPIO_WriteLow(D1_7seg);
1619  04f4 4b08          	push	#8
1620  04f6 ae500f        	ldw	x,#20495
1621  04f9 cd0000        	call	_GPIO_WriteLow
1623  04fc 84            	pop	a
1624                     ; 216 	GPIO_WriteLow(E1_7seg);
1626  04fd 4b10          	push	#16
1627  04ff ae500f        	ldw	x,#20495
1628  0502 cd0000        	call	_GPIO_WriteLow
1630  0505 84            	pop	a
1631                     ; 217 	GPIO_WriteLow(F1_7seg);
1633  0506 4b20          	push	#32
1634  0508 ae500f        	ldw	x,#20495
1635  050b cd0000        	call	_GPIO_WriteLow
1637  050e 84            	pop	a
1638                     ; 218 	GPIO_WriteHigh(G1_7seg);
1640  050f 4b40          	push	#64
1641  0511 ae500f        	ldw	x,#20495
1642  0514 cd0000        	call	_GPIO_WriteHigh
1644  0517 84            	pop	a
1645                     ; 219 	GPIO_WriteHigh(DP1_7seg);
1647  0518 4b80          	push	#128
1648  051a ae500f        	ldw	x,#20495
1649  051d cd0000        	call	_GPIO_WriteHigh
1651  0520 84            	pop	a
1652                     ; 220 }
1655  0521 81            	ret
1680                     ; 222 void Bone(void) {
1681                     	switch	.text
1682  0522               _Bone:
1686                     ; 223   GPIO_WriteHigh(A1_7seg);
1688  0522 4b01          	push	#1
1689  0524 ae500f        	ldw	x,#20495
1690  0527 cd0000        	call	_GPIO_WriteHigh
1692  052a 84            	pop	a
1693                     ; 224 	GPIO_WriteLow(B1_7seg);
1695  052b 4b02          	push	#2
1696  052d ae500f        	ldw	x,#20495
1697  0530 cd0000        	call	_GPIO_WriteLow
1699  0533 84            	pop	a
1700                     ; 225 	GPIO_WriteLow(C1_7seg);
1702  0534 4b04          	push	#4
1703  0536 ae500f        	ldw	x,#20495
1704  0539 cd0000        	call	_GPIO_WriteLow
1706  053c 84            	pop	a
1707                     ; 226 	GPIO_WriteHigh(D1_7seg);
1709  053d 4b08          	push	#8
1710  053f ae500f        	ldw	x,#20495
1711  0542 cd0000        	call	_GPIO_WriteHigh
1713  0545 84            	pop	a
1714                     ; 227 	GPIO_WriteHigh(E1_7seg);
1716  0546 4b10          	push	#16
1717  0548 ae500f        	ldw	x,#20495
1718  054b cd0000        	call	_GPIO_WriteHigh
1720  054e 84            	pop	a
1721                     ; 228 	GPIO_WriteHigh(F1_7seg);
1723  054f 4b20          	push	#32
1724  0551 ae500f        	ldw	x,#20495
1725  0554 cd0000        	call	_GPIO_WriteHigh
1727  0557 84            	pop	a
1728                     ; 229 	GPIO_WriteHigh(G1_7seg);
1730  0558 4b40          	push	#64
1731  055a ae500f        	ldw	x,#20495
1732  055d cd0000        	call	_GPIO_WriteHigh
1734  0560 84            	pop	a
1735                     ; 230 	GPIO_WriteHigh(DP1_7seg);
1737  0561 4b80          	push	#128
1738  0563 ae500f        	ldw	x,#20495
1739  0566 cd0000        	call	_GPIO_WriteHigh
1741  0569 84            	pop	a
1742                     ; 231 }
1745  056a 81            	ret
1770                     ; 233 void Btwo(void) {
1771                     	switch	.text
1772  056b               _Btwo:
1776                     ; 234   GPIO_WriteLow(A1_7seg);
1778  056b 4b01          	push	#1
1779  056d ae500f        	ldw	x,#20495
1780  0570 cd0000        	call	_GPIO_WriteLow
1782  0573 84            	pop	a
1783                     ; 235 	GPIO_WriteLow(B1_7seg);
1785  0574 4b02          	push	#2
1786  0576 ae500f        	ldw	x,#20495
1787  0579 cd0000        	call	_GPIO_WriteLow
1789  057c 84            	pop	a
1790                     ; 236 	GPIO_WriteHigh(C1_7seg);
1792  057d 4b04          	push	#4
1793  057f ae500f        	ldw	x,#20495
1794  0582 cd0000        	call	_GPIO_WriteHigh
1796  0585 84            	pop	a
1797                     ; 237 	GPIO_WriteLow(D1_7seg);
1799  0586 4b08          	push	#8
1800  0588 ae500f        	ldw	x,#20495
1801  058b cd0000        	call	_GPIO_WriteLow
1803  058e 84            	pop	a
1804                     ; 238 	GPIO_WriteLow(E1_7seg);
1806  058f 4b10          	push	#16
1807  0591 ae500f        	ldw	x,#20495
1808  0594 cd0000        	call	_GPIO_WriteLow
1810  0597 84            	pop	a
1811                     ; 239 	GPIO_WriteHigh(F1_7seg);
1813  0598 4b20          	push	#32
1814  059a ae500f        	ldw	x,#20495
1815  059d cd0000        	call	_GPIO_WriteHigh
1817  05a0 84            	pop	a
1818                     ; 240 	GPIO_WriteLow(G1_7seg);
1820  05a1 4b40          	push	#64
1821  05a3 ae500f        	ldw	x,#20495
1822  05a6 cd0000        	call	_GPIO_WriteLow
1824  05a9 84            	pop	a
1825                     ; 241 	GPIO_WriteHigh(DP1_7seg);
1827  05aa 4b80          	push	#128
1828  05ac ae500f        	ldw	x,#20495
1829  05af cd0000        	call	_GPIO_WriteHigh
1831  05b2 84            	pop	a
1832                     ; 242 }
1835  05b3 81            	ret
1860                     ; 244 void Bthree(void) {
1861                     	switch	.text
1862  05b4               _Bthree:
1866                     ; 245   GPIO_WriteLow(A1_7seg);
1868  05b4 4b01          	push	#1
1869  05b6 ae500f        	ldw	x,#20495
1870  05b9 cd0000        	call	_GPIO_WriteLow
1872  05bc 84            	pop	a
1873                     ; 246 	GPIO_WriteLow(B1_7seg);
1875  05bd 4b02          	push	#2
1876  05bf ae500f        	ldw	x,#20495
1877  05c2 cd0000        	call	_GPIO_WriteLow
1879  05c5 84            	pop	a
1880                     ; 247 	GPIO_WriteLow(C1_7seg);
1882  05c6 4b04          	push	#4
1883  05c8 ae500f        	ldw	x,#20495
1884  05cb cd0000        	call	_GPIO_WriteLow
1886  05ce 84            	pop	a
1887                     ; 248 	GPIO_WriteLow(D1_7seg);
1889  05cf 4b08          	push	#8
1890  05d1 ae500f        	ldw	x,#20495
1891  05d4 cd0000        	call	_GPIO_WriteLow
1893  05d7 84            	pop	a
1894                     ; 249 	GPIO_WriteHigh(E1_7seg);
1896  05d8 4b10          	push	#16
1897  05da ae500f        	ldw	x,#20495
1898  05dd cd0000        	call	_GPIO_WriteHigh
1900  05e0 84            	pop	a
1901                     ; 250 	GPIO_WriteHigh(F1_7seg);
1903  05e1 4b20          	push	#32
1904  05e3 ae500f        	ldw	x,#20495
1905  05e6 cd0000        	call	_GPIO_WriteHigh
1907  05e9 84            	pop	a
1908                     ; 251 	GPIO_WriteLow(G1_7seg);
1910  05ea 4b40          	push	#64
1911  05ec ae500f        	ldw	x,#20495
1912  05ef cd0000        	call	_GPIO_WriteLow
1914  05f2 84            	pop	a
1915                     ; 252 	GPIO_WriteHigh(DP1_7seg);
1917  05f3 4b80          	push	#128
1918  05f5 ae500f        	ldw	x,#20495
1919  05f8 cd0000        	call	_GPIO_WriteHigh
1921  05fb 84            	pop	a
1922                     ; 253 }
1925  05fc 81            	ret
1950                     ; 255 void Bfour(void) {
1951                     	switch	.text
1952  05fd               _Bfour:
1956                     ; 256   GPIO_WriteHigh(A1_7seg);
1958  05fd 4b01          	push	#1
1959  05ff ae500f        	ldw	x,#20495
1960  0602 cd0000        	call	_GPIO_WriteHigh
1962  0605 84            	pop	a
1963                     ; 257 	GPIO_WriteLow(B1_7seg);
1965  0606 4b02          	push	#2
1966  0608 ae500f        	ldw	x,#20495
1967  060b cd0000        	call	_GPIO_WriteLow
1969  060e 84            	pop	a
1970                     ; 258 	GPIO_WriteLow(C1_7seg);
1972  060f 4b04          	push	#4
1973  0611 ae500f        	ldw	x,#20495
1974  0614 cd0000        	call	_GPIO_WriteLow
1976  0617 84            	pop	a
1977                     ; 259 	GPIO_WriteHigh(D1_7seg);
1979  0618 4b08          	push	#8
1980  061a ae500f        	ldw	x,#20495
1981  061d cd0000        	call	_GPIO_WriteHigh
1983  0620 84            	pop	a
1984                     ; 260 	GPIO_WriteHigh(E1_7seg);
1986  0621 4b10          	push	#16
1987  0623 ae500f        	ldw	x,#20495
1988  0626 cd0000        	call	_GPIO_WriteHigh
1990  0629 84            	pop	a
1991                     ; 261 	GPIO_WriteLow(F1_7seg);
1993  062a 4b20          	push	#32
1994  062c ae500f        	ldw	x,#20495
1995  062f cd0000        	call	_GPIO_WriteLow
1997  0632 84            	pop	a
1998                     ; 262 	GPIO_WriteLow(G1_7seg);
2000  0633 4b40          	push	#64
2001  0635 ae500f        	ldw	x,#20495
2002  0638 cd0000        	call	_GPIO_WriteLow
2004  063b 84            	pop	a
2005                     ; 263 	GPIO_WriteHigh(DP1_7seg);
2007  063c 4b80          	push	#128
2008  063e ae500f        	ldw	x,#20495
2009  0641 cd0000        	call	_GPIO_WriteHigh
2011  0644 84            	pop	a
2012                     ; 264 }
2015  0645 81            	ret
2040                     ; 266 void Bfive(void) {
2041                     	switch	.text
2042  0646               _Bfive:
2046                     ; 267   GPIO_WriteLow(A1_7seg);
2048  0646 4b01          	push	#1
2049  0648 ae500f        	ldw	x,#20495
2050  064b cd0000        	call	_GPIO_WriteLow
2052  064e 84            	pop	a
2053                     ; 268 	GPIO_WriteHigh(B1_7seg);
2055  064f 4b02          	push	#2
2056  0651 ae500f        	ldw	x,#20495
2057  0654 cd0000        	call	_GPIO_WriteHigh
2059  0657 84            	pop	a
2060                     ; 269 	GPIO_WriteLow(C1_7seg);
2062  0658 4b04          	push	#4
2063  065a ae500f        	ldw	x,#20495
2064  065d cd0000        	call	_GPIO_WriteLow
2066  0660 84            	pop	a
2067                     ; 270 	GPIO_WriteLow(D1_7seg);
2069  0661 4b08          	push	#8
2070  0663 ae500f        	ldw	x,#20495
2071  0666 cd0000        	call	_GPIO_WriteLow
2073  0669 84            	pop	a
2074                     ; 271 	GPIO_WriteHigh(E1_7seg);
2076  066a 4b10          	push	#16
2077  066c ae500f        	ldw	x,#20495
2078  066f cd0000        	call	_GPIO_WriteHigh
2080  0672 84            	pop	a
2081                     ; 272 	GPIO_WriteLow(F1_7seg);
2083  0673 4b20          	push	#32
2084  0675 ae500f        	ldw	x,#20495
2085  0678 cd0000        	call	_GPIO_WriteLow
2087  067b 84            	pop	a
2088                     ; 273 	GPIO_WriteLow(G1_7seg);
2090  067c 4b40          	push	#64
2091  067e ae500f        	ldw	x,#20495
2092  0681 cd0000        	call	_GPIO_WriteLow
2094  0684 84            	pop	a
2095                     ; 274 	GPIO_WriteHigh(DP1_7seg);
2097  0685 4b80          	push	#128
2098  0687 ae500f        	ldw	x,#20495
2099  068a cd0000        	call	_GPIO_WriteHigh
2101  068d 84            	pop	a
2102                     ; 275 }
2105  068e 81            	ret
2130                     ; 277 void Bsix(void) {
2131                     	switch	.text
2132  068f               _Bsix:
2136                     ; 278   GPIO_WriteLow(A1_7seg);
2138  068f 4b01          	push	#1
2139  0691 ae500f        	ldw	x,#20495
2140  0694 cd0000        	call	_GPIO_WriteLow
2142  0697 84            	pop	a
2143                     ; 279 	GPIO_WriteHigh(B1_7seg);
2145  0698 4b02          	push	#2
2146  069a ae500f        	ldw	x,#20495
2147  069d cd0000        	call	_GPIO_WriteHigh
2149  06a0 84            	pop	a
2150                     ; 280 	GPIO_WriteLow(C1_7seg);
2152  06a1 4b04          	push	#4
2153  06a3 ae500f        	ldw	x,#20495
2154  06a6 cd0000        	call	_GPIO_WriteLow
2156  06a9 84            	pop	a
2157                     ; 281 	GPIO_WriteLow(D1_7seg);
2159  06aa 4b08          	push	#8
2160  06ac ae500f        	ldw	x,#20495
2161  06af cd0000        	call	_GPIO_WriteLow
2163  06b2 84            	pop	a
2164                     ; 282 	GPIO_WriteLow(E1_7seg);
2166  06b3 4b10          	push	#16
2167  06b5 ae500f        	ldw	x,#20495
2168  06b8 cd0000        	call	_GPIO_WriteLow
2170  06bb 84            	pop	a
2171                     ; 283 	GPIO_WriteLow(F1_7seg);
2173  06bc 4b20          	push	#32
2174  06be ae500f        	ldw	x,#20495
2175  06c1 cd0000        	call	_GPIO_WriteLow
2177  06c4 84            	pop	a
2178                     ; 284 	GPIO_WriteLow(G1_7seg);
2180  06c5 4b40          	push	#64
2181  06c7 ae500f        	ldw	x,#20495
2182  06ca cd0000        	call	_GPIO_WriteLow
2184  06cd 84            	pop	a
2185                     ; 285 	GPIO_WriteHigh(DP1_7seg);
2187  06ce 4b80          	push	#128
2188  06d0 ae500f        	ldw	x,#20495
2189  06d3 cd0000        	call	_GPIO_WriteHigh
2191  06d6 84            	pop	a
2192                     ; 286 }
2195  06d7 81            	ret
2220                     ; 288 void Bseven(void) {
2221                     	switch	.text
2222  06d8               _Bseven:
2226                     ; 289   GPIO_WriteLow(A1_7seg);
2228  06d8 4b01          	push	#1
2229  06da ae500f        	ldw	x,#20495
2230  06dd cd0000        	call	_GPIO_WriteLow
2232  06e0 84            	pop	a
2233                     ; 290 	GPIO_WriteLow(B1_7seg);
2235  06e1 4b02          	push	#2
2236  06e3 ae500f        	ldw	x,#20495
2237  06e6 cd0000        	call	_GPIO_WriteLow
2239  06e9 84            	pop	a
2240                     ; 291 	GPIO_WriteLow(C1_7seg);
2242  06ea 4b04          	push	#4
2243  06ec ae500f        	ldw	x,#20495
2244  06ef cd0000        	call	_GPIO_WriteLow
2246  06f2 84            	pop	a
2247                     ; 292 	GPIO_WriteHigh(D1_7seg);
2249  06f3 4b08          	push	#8
2250  06f5 ae500f        	ldw	x,#20495
2251  06f8 cd0000        	call	_GPIO_WriteHigh
2253  06fb 84            	pop	a
2254                     ; 293 	GPIO_WriteHigh(E1_7seg);
2256  06fc 4b10          	push	#16
2257  06fe ae500f        	ldw	x,#20495
2258  0701 cd0000        	call	_GPIO_WriteHigh
2260  0704 84            	pop	a
2261                     ; 294 	GPIO_WriteHigh(F1_7seg);
2263  0705 4b20          	push	#32
2264  0707 ae500f        	ldw	x,#20495
2265  070a cd0000        	call	_GPIO_WriteHigh
2267  070d 84            	pop	a
2268                     ; 295 	GPIO_WriteHigh(G1_7seg);
2270  070e 4b40          	push	#64
2271  0710 ae500f        	ldw	x,#20495
2272  0713 cd0000        	call	_GPIO_WriteHigh
2274  0716 84            	pop	a
2275                     ; 296 	GPIO_WriteHigh(DP1_7seg);
2277  0717 4b80          	push	#128
2278  0719 ae500f        	ldw	x,#20495
2279  071c cd0000        	call	_GPIO_WriteHigh
2281  071f 84            	pop	a
2282                     ; 297 }
2285  0720 81            	ret
2310                     ; 299 void Beight(void) {
2311                     	switch	.text
2312  0721               _Beight:
2316                     ; 300   GPIO_WriteLow(A1_7seg);
2318  0721 4b01          	push	#1
2319  0723 ae500f        	ldw	x,#20495
2320  0726 cd0000        	call	_GPIO_WriteLow
2322  0729 84            	pop	a
2323                     ; 301 	GPIO_WriteLow(B1_7seg);
2325  072a 4b02          	push	#2
2326  072c ae500f        	ldw	x,#20495
2327  072f cd0000        	call	_GPIO_WriteLow
2329  0732 84            	pop	a
2330                     ; 302 	GPIO_WriteLow(C1_7seg);
2332  0733 4b04          	push	#4
2333  0735 ae500f        	ldw	x,#20495
2334  0738 cd0000        	call	_GPIO_WriteLow
2336  073b 84            	pop	a
2337                     ; 303 	GPIO_WriteLow(D1_7seg);
2339  073c 4b08          	push	#8
2340  073e ae500f        	ldw	x,#20495
2341  0741 cd0000        	call	_GPIO_WriteLow
2343  0744 84            	pop	a
2344                     ; 304 	GPIO_WriteLow(E1_7seg);
2346  0745 4b10          	push	#16
2347  0747 ae500f        	ldw	x,#20495
2348  074a cd0000        	call	_GPIO_WriteLow
2350  074d 84            	pop	a
2351                     ; 305 	GPIO_WriteLow(F1_7seg);
2353  074e 4b20          	push	#32
2354  0750 ae500f        	ldw	x,#20495
2355  0753 cd0000        	call	_GPIO_WriteLow
2357  0756 84            	pop	a
2358                     ; 306 	GPIO_WriteLow(G1_7seg);
2360  0757 4b40          	push	#64
2361  0759 ae500f        	ldw	x,#20495
2362  075c cd0000        	call	_GPIO_WriteLow
2364  075f 84            	pop	a
2365                     ; 307 	GPIO_WriteHigh(DP1_7seg);
2367  0760 4b80          	push	#128
2368  0762 ae500f        	ldw	x,#20495
2369  0765 cd0000        	call	_GPIO_WriteHigh
2371  0768 84            	pop	a
2372                     ; 308 }
2375  0769 81            	ret
2400                     ; 310 void Bnine(void) {
2401                     	switch	.text
2402  076a               _Bnine:
2406                     ; 311   GPIO_WriteLow(A1_7seg);
2408  076a 4b01          	push	#1
2409  076c ae500f        	ldw	x,#20495
2410  076f cd0000        	call	_GPIO_WriteLow
2412  0772 84            	pop	a
2413                     ; 312 	GPIO_WriteLow(B1_7seg);
2415  0773 4b02          	push	#2
2416  0775 ae500f        	ldw	x,#20495
2417  0778 cd0000        	call	_GPIO_WriteLow
2419  077b 84            	pop	a
2420                     ; 313 	GPIO_WriteLow(C1_7seg);
2422  077c 4b04          	push	#4
2423  077e ae500f        	ldw	x,#20495
2424  0781 cd0000        	call	_GPIO_WriteLow
2426  0784 84            	pop	a
2427                     ; 314 	GPIO_WriteHigh(D1_7seg);
2429  0785 4b08          	push	#8
2430  0787 ae500f        	ldw	x,#20495
2431  078a cd0000        	call	_GPIO_WriteHigh
2433  078d 84            	pop	a
2434                     ; 315 	GPIO_WriteHigh(E1_7seg);
2436  078e 4b10          	push	#16
2437  0790 ae500f        	ldw	x,#20495
2438  0793 cd0000        	call	_GPIO_WriteHigh
2440  0796 84            	pop	a
2441                     ; 316 	GPIO_WriteLow(F1_7seg);
2443  0797 4b20          	push	#32
2444  0799 ae500f        	ldw	x,#20495
2445  079c cd0000        	call	_GPIO_WriteLow
2447  079f 84            	pop	a
2448                     ; 317 	GPIO_WriteLow(G1_7seg);
2450  07a0 4b40          	push	#64
2451  07a2 ae500f        	ldw	x,#20495
2452  07a5 cd0000        	call	_GPIO_WriteLow
2454  07a8 84            	pop	a
2455                     ; 318 	GPIO_WriteHigh(DP1_7seg);
2457  07a9 4b80          	push	#128
2458  07ab ae500f        	ldw	x,#20495
2459  07ae cd0000        	call	_GPIO_WriteHigh
2461  07b1 84            	pop	a
2462                     ; 319 }
2465  07b2 81            	ret
2537                     ; 321 void printDigit(int x){
2538                     	switch	.text
2539  07b3               _printDigit:
2541  07b3 89            	pushw	x
2542  07b4 5204          	subw	sp,#4
2543       00000004      OFST:	set	4
2546                     ; 323   int dig0 = x%10;
2548  07b6 a60a          	ld	a,#10
2549  07b8 cd0000        	call	c_smodx
2551  07bb 1f01          	ldw	(OFST-3,sp),x
2553                     ; 324   int dig1 = x/10;
2555  07bd 1e05          	ldw	x,(OFST+1,sp)
2556  07bf a60a          	ld	a,#10
2557  07c1 cd0000        	call	c_sdivx
2559  07c4 1f03          	ldw	(OFST-1,sp),x
2561                     ; 326   switch (dig0){
2563  07c6 1e01          	ldw	x,(OFST-3,sp)
2565                     ; 347     default: break;
2566  07c8 5d            	tnzw	x
2567  07c9 271d          	jreq	L724
2568  07cb 5a            	decw	x
2569  07cc 271f          	jreq	L134
2570  07ce 5a            	decw	x
2571  07cf 2721          	jreq	L334
2572  07d1 5a            	decw	x
2573  07d2 2723          	jreq	L534
2574  07d4 5a            	decw	x
2575  07d5 2725          	jreq	L734
2576  07d7 5a            	decw	x
2577  07d8 2727          	jreq	L144
2578  07da 5a            	decw	x
2579  07db 2729          	jreq	L344
2580  07dd 5a            	decw	x
2581  07de 272b          	jreq	L544
2582  07e0 5a            	decw	x
2583  07e1 272d          	jreq	L744
2584  07e3 5a            	decw	x
2585  07e4 272f          	jreq	L154
2586  07e6 2030          	jra	L335
2587  07e8               L724:
2588                     ; 327     case 0: {Bzero();
2590  07e8 cd04d9        	call	_Bzero
2592                     ; 328              break;}
2594  07eb 202b          	jra	L335
2595  07ed               L134:
2596                     ; 329     case 1: {Bone();
2598  07ed cd0522        	call	_Bone
2600                     ; 330              break;}
2602  07f0 2026          	jra	L335
2603  07f2               L334:
2604                     ; 331     case 2: {Btwo();
2606  07f2 cd056b        	call	_Btwo
2608                     ; 332              break;}
2610  07f5 2021          	jra	L335
2611  07f7               L534:
2612                     ; 333     case 3: {Bthree();
2614  07f7 cd05b4        	call	_Bthree
2616                     ; 334              break;}
2618  07fa 201c          	jra	L335
2619  07fc               L734:
2620                     ; 335     case 4: {Bfour();
2622  07fc cd05fd        	call	_Bfour
2624                     ; 336              break;}
2626  07ff 2017          	jra	L335
2627  0801               L144:
2628                     ; 337     case 5: {Bfive();
2630  0801 cd0646        	call	_Bfive
2632                     ; 338              break;}
2634  0804 2012          	jra	L335
2635  0806               L344:
2636                     ; 339     case 6: {Bsix();
2638  0806 cd068f        	call	_Bsix
2640                     ; 340              break;}
2642  0809 200d          	jra	L335
2643  080b               L544:
2644                     ; 341     case 7: {Bseven();
2646  080b cd06d8        	call	_Bseven
2648                     ; 342              break;}
2650  080e 2008          	jra	L335
2651  0810               L744:
2652                     ; 343     case 8: {Beight();
2654  0810 cd0721        	call	_Beight
2656                     ; 344              break;}
2658  0813 2003          	jra	L335
2659  0815               L154:
2660                     ; 345     case 9: {Bnine();
2662  0815 cd076a        	call	_Bnine
2664                     ; 346              break;}
2666  0818               L354:
2667                     ; 347     default: break;
2669  0818               L335:
2670                     ; 349   switch (dig1){
2672  0818 1e03          	ldw	x,(OFST-1,sp)
2674                     ; 370     default: break;
2675  081a 5d            	tnzw	x
2676  081b 271d          	jreq	L554
2677  081d 5a            	decw	x
2678  081e 271f          	jreq	L754
2679  0820 5a            	decw	x
2680  0821 2721          	jreq	L164
2681  0823 5a            	decw	x
2682  0824 2723          	jreq	L364
2683  0826 5a            	decw	x
2684  0827 2725          	jreq	L564
2685  0829 5a            	decw	x
2686  082a 2727          	jreq	L764
2687  082c 5a            	decw	x
2688  082d 2729          	jreq	L174
2689  082f 5a            	decw	x
2690  0830 272b          	jreq	L374
2691  0832 5a            	decw	x
2692  0833 272d          	jreq	L574
2693  0835 5a            	decw	x
2694  0836 272f          	jreq	L774
2695  0838 2030          	jra	L735
2696  083a               L554:
2697                     ; 350     case 0: {Azero();
2699  083a cd01ff        	call	_Azero
2701                     ; 351              break;}
2703  083d 202b          	jra	L735
2704  083f               L754:
2705                     ; 352     case 1: {Aone();
2707  083f cd0248        	call	_Aone
2709                     ; 353              break;}
2711  0842 2026          	jra	L735
2712  0844               L164:
2713                     ; 354     case 2: {Atwo();
2715  0844 cd0291        	call	_Atwo
2717                     ; 355              break;}
2719  0847 2021          	jra	L735
2720  0849               L364:
2721                     ; 356     case 3: {Athree();
2723  0849 cd02da        	call	_Athree
2725                     ; 357              break;}
2727  084c 201c          	jra	L735
2728  084e               L564:
2729                     ; 358     case 4: {Afour();
2731  084e cd0323        	call	_Afour
2733                     ; 359              break;}
2735  0851 2017          	jra	L735
2736  0853               L764:
2737                     ; 360     case 5: {Afive();
2739  0853 cd036c        	call	_Afive
2741                     ; 361              break;}
2743  0856 2012          	jra	L735
2744  0858               L174:
2745                     ; 362     case 6: {Asix();
2747  0858 cd03b5        	call	_Asix
2749                     ; 363              break;}
2751  085b 200d          	jra	L735
2752  085d               L374:
2753                     ; 364     case 7: {Aseven();
2755  085d cd03fe        	call	_Aseven
2757                     ; 365              break;}
2759  0860 2008          	jra	L735
2760  0862               L574:
2761                     ; 366     case 8: {Aeight();
2763  0862 cd0447        	call	_Aeight
2765                     ; 367              break;}
2767  0865 2003          	jra	L735
2768  0867               L774:
2769                     ; 368     case 9: {Anine();
2771  0867 cd0490        	call	_Anine
2773                     ; 369              break;}
2775  086a               L105:
2776                     ; 370     default: break;
2778  086a               L735:
2779                     ; 372 }
2782  086a 5b06          	addw	sp,#6
2783  086c 81            	ret
2816                     	xdef	_Bnine
2817                     	xdef	_Beight
2818                     	xdef	_Bseven
2819                     	xdef	_Bsix
2820                     	xdef	_Bfive
2821                     	xdef	_Bfour
2822                     	xdef	_Bthree
2823                     	xdef	_Btwo
2824                     	xdef	_Bone
2825                     	xdef	_Bzero
2826                     	xdef	_Anine
2827                     	xdef	_Aeight
2828                     	xdef	_Aseven
2829                     	xdef	_Asix
2830                     	xdef	_Afive
2831                     	xdef	_Afour
2832                     	xdef	_Athree
2833                     	xdef	_Atwo
2834                     	xdef	_Aone
2835                     	xdef	_Azero
2836                     	xdef	_main
2837                     	xdef	_printDigit
2838                     	xdef	_delay
2839                     	xdef	_n
2840                     	xdef	_ADC_value_1
2841                     	xdef	_ADC_Read
2842                     	xref	_GPIO_ReadInputPin
2843                     	xref	_GPIO_WriteLow
2844                     	xref	_GPIO_WriteHigh
2845                     	xref	_GPIO_Init
2846                     	xref	_GPIO_DeInit
2847                     	xref	_ADC1_ClearFlag
2848                     	xref	_ADC1_GetFlagStatus
2849                     	xref	_ADC1_GetConversionValue
2850                     	xref	_ADC1_StartConversion
2851                     	xref	_ADC1_Cmd
2852                     	xref	_ADC1_Init
2853                     	xref	_ADC1_DeInit
2854                     	xref.b	c_x
2873                     	xref	c_sdivx
2874                     	xref	c_smodx
2875                     	end
