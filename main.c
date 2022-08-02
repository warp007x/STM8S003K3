//2 seperate 7 segment displays
# define A0_7seg GPIOE, GPIO_PIN_5
# define B0_7seg GPIOC, GPIO_PIN_1
# define C0_7seg GPIOC, GPIO_PIN_2
# define D0_7seg GPIOC, GPIO_PIN_3
# define E0_7seg GPIOC, GPIO_PIN_4
# define F0_7seg GPIOC, GPIO_PIN_5
# define G0_7seg GPIOC, GPIO_PIN_6
# define DP0_7seg GPIOC, GPIO_PIN_7
# define A1_7seg GPIOD, GPIO_PIN_0
# define B1_7seg GPIOD, GPIO_PIN_1
# define C1_7seg GPIOD, GPIO_PIN_2
# define D1_7seg GPIOD, GPIO_PIN_3
# define E1_7seg GPIOD, GPIO_PIN_4
# define F1_7seg GPIOD, GPIO_PIN_5
# define G1_7seg GPIOD, GPIO_PIN_6
# define DP1_7seg GPIOD, GPIO_PIN_7

# include "stm8s.h"
# include "stm8s_adc1.h"
# include "stm8s103_ADC.h"

unsigned int ADC_value_1 = 0;
int n=4;

void delay(int ms){
	int i=0, j=0;
	for(i=0; i<=ms; i++){
		for(j=0; j<120; j++){
			_asm("nop");
			}
	}
}

void printDigit(int);

void main()
{
	GPIO_DeInit(GPIOA);
	GPIO_DeInit(GPIOB);
	GPIO_DeInit(GPIOC);
	GPIO_DeInit(GPIOD);
	GPIO_DeInit(GPIOE);
	GPIO_DeInit(GPIOF);
	
	GPIO_Init (GPIOB, GPIO_PIN_4, GPIO_MODE_IN_PU_IT);//increment button
	GPIO_Init (GPIOB, GPIO_PIN_5, GPIO_MODE_IN_PU_IT);//dectrement button
	GPIO_Init (GPIOB, GPIO_PIN_6, GPIO_MODE_IN_PU_IT);//set button
	
	
	GPIO_Init (GPIOB, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
	
	GPIO_Init (A0_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_Init (B0_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_Init (C0_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_Init (D0_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_Init (E0_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_Init (F0_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_Init (G0_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_Init (DP0_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_Init (A1_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_Init (B1_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_Init (C1_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_Init (D1_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_Init (E1_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_Init (F1_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_Init (G1_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_Init (DP1_7seg, GPIO_MODE_OUT_PP_HIGH_SLOW);
	
	ADC_value_1 = ADC_Read (AIN2);
	

	while (1){
		if (GPIO_ReadInputPin(GPIOB, GPIO_PIN_4))
			n++;
		if (GPIO_ReadInputPin(GPIOB, GPIO_PIN_5))
			n--;
		if (GPIO_ReadInputPin(GPIOB, GPIO_PIN_6))
			{
				while(n!=-1){
    	 
				printDigit(n--);
				GPIO_WriteHigh(GPIOB,GPIO_PIN_3);
				delay(1000);
				}
				if(n==-1){
					GPIO_WriteLow(GPIOB,GPIO_PIN_3);
					n=0;
				}
			}
			
		if(ADC_value_1>0){
			GPIO_WriteHigh(GPIOB,GPIO_PIN_3);
				}
		else GPIO_WriteLow(GPIOB,GPIO_PIN_3);
	
			delay(300);
	}
}

void Azero(void) {
  GPIO_WriteLow(A0_7seg);
	GPIO_WriteLow(B0_7seg);
	GPIO_WriteLow(C0_7seg);
	GPIO_WriteLow(D0_7seg);
	GPIO_WriteLow(E0_7seg);
	GPIO_WriteLow(F0_7seg);
	GPIO_WriteHigh(G0_7seg);
	GPIO_WriteLow(DP0_7seg);
}

void Aone(void) {
  GPIO_WriteHigh(A0_7seg);
	GPIO_WriteLow(B0_7seg);
	GPIO_WriteLow(C0_7seg);
	GPIO_WriteHigh(D0_7seg);
	GPIO_WriteHigh(E0_7seg);
	GPIO_WriteHigh(F0_7seg);
	GPIO_WriteHigh(G0_7seg);
	GPIO_WriteLow(DP0_7seg);
}

void Atwo(void) {
  GPIO_WriteLow(A0_7seg);
	GPIO_WriteLow(B0_7seg);
	GPIO_WriteHigh(C0_7seg);
	GPIO_WriteLow(D0_7seg);
	GPIO_WriteLow(E0_7seg);
	GPIO_WriteHigh(F0_7seg);
	GPIO_WriteLow(G0_7seg);
	GPIO_WriteLow(DP0_7seg);
}

void Athree(void) {
  GPIO_WriteLow(A0_7seg);
	GPIO_WriteLow(B0_7seg);
	GPIO_WriteLow(C0_7seg);
	GPIO_WriteLow(D0_7seg);
	GPIO_WriteHigh(E0_7seg);
	GPIO_WriteHigh(F0_7seg);
	GPIO_WriteLow(G0_7seg);
	GPIO_WriteLow(DP0_7seg);
}

void Afour(void) {
  GPIO_WriteHigh(A0_7seg);
	GPIO_WriteLow(B0_7seg);
	GPIO_WriteLow(C0_7seg);
	GPIO_WriteHigh(D0_7seg);
	GPIO_WriteHigh(E0_7seg);
	GPIO_WriteLow(F0_7seg);
	GPIO_WriteLow(G0_7seg);
	GPIO_WriteLow(DP0_7seg);
}

void Afive(void) {
  GPIO_WriteLow(A0_7seg);
	GPIO_WriteHigh(B0_7seg);
	GPIO_WriteLow(C0_7seg);
	GPIO_WriteLow(D0_7seg);
	GPIO_WriteHigh(E0_7seg);
	GPIO_WriteLow(F0_7seg);
	GPIO_WriteLow(G0_7seg);
	GPIO_WriteLow(DP0_7seg);
}

void Asix(void) {
  GPIO_WriteLow(A0_7seg);
	GPIO_WriteHigh(B0_7seg);
	GPIO_WriteLow(C0_7seg);
	GPIO_WriteLow(D0_7seg);
	GPIO_WriteLow(E0_7seg);
	GPIO_WriteLow(F0_7seg);
	GPIO_WriteLow(G0_7seg);
	GPIO_WriteLow(DP0_7seg);
}

void Aseven(void) {
  GPIO_WriteLow(A0_7seg);
	GPIO_WriteLow(B0_7seg);
	GPIO_WriteLow(C0_7seg);
	GPIO_WriteHigh(D0_7seg);
	GPIO_WriteHigh(E0_7seg);
	GPIO_WriteHigh(F0_7seg);
	GPIO_WriteHigh(G0_7seg);
	GPIO_WriteLow(DP0_7seg);
}

void Aeight(void) {
  GPIO_WriteLow(A0_7seg);
	GPIO_WriteLow(B0_7seg);
	GPIO_WriteLow(C0_7seg);
	GPIO_WriteLow(D0_7seg);
	GPIO_WriteLow(E0_7seg);
	GPIO_WriteLow(F0_7seg);
	GPIO_WriteLow(G0_7seg);
	GPIO_WriteLow(DP0_7seg);
}

void Anine(void) {
  GPIO_WriteLow(A0_7seg);
	GPIO_WriteLow(B0_7seg);
	GPIO_WriteLow(C0_7seg);
	GPIO_WriteHigh(D0_7seg);
	GPIO_WriteHigh(E0_7seg);
	GPIO_WriteLow(F0_7seg);
	GPIO_WriteLow(G0_7seg);
	GPIO_WriteLow(DP0_7seg);
}

void Bzero(void) {
  GPIO_WriteLow(A1_7seg);
	GPIO_WriteLow(B1_7seg);
	GPIO_WriteLow(C1_7seg);
	GPIO_WriteLow(D1_7seg);
	GPIO_WriteLow(E1_7seg);
	GPIO_WriteLow(F1_7seg);
	GPIO_WriteHigh(G1_7seg);
	GPIO_WriteHigh(DP1_7seg);
}

void Bone(void) {
  GPIO_WriteHigh(A1_7seg);
	GPIO_WriteLow(B1_7seg);
	GPIO_WriteLow(C1_7seg);
	GPIO_WriteHigh(D1_7seg);
	GPIO_WriteHigh(E1_7seg);
	GPIO_WriteHigh(F1_7seg);
	GPIO_WriteHigh(G1_7seg);
	GPIO_WriteHigh(DP1_7seg);
}

void Btwo(void) {
  GPIO_WriteLow(A1_7seg);
	GPIO_WriteLow(B1_7seg);
	GPIO_WriteHigh(C1_7seg);
	GPIO_WriteLow(D1_7seg);
	GPIO_WriteLow(E1_7seg);
	GPIO_WriteHigh(F1_7seg);
	GPIO_WriteLow(G1_7seg);
	GPIO_WriteHigh(DP1_7seg);
}

void Bthree(void) {
  GPIO_WriteLow(A1_7seg);
	GPIO_WriteLow(B1_7seg);
	GPIO_WriteLow(C1_7seg);
	GPIO_WriteLow(D1_7seg);
	GPIO_WriteHigh(E1_7seg);
	GPIO_WriteHigh(F1_7seg);
	GPIO_WriteLow(G1_7seg);
	GPIO_WriteHigh(DP1_7seg);
}

void Bfour(void) {
  GPIO_WriteHigh(A1_7seg);
	GPIO_WriteLow(B1_7seg);
	GPIO_WriteLow(C1_7seg);
	GPIO_WriteHigh(D1_7seg);
	GPIO_WriteHigh(E1_7seg);
	GPIO_WriteLow(F1_7seg);
	GPIO_WriteLow(G1_7seg);
	GPIO_WriteHigh(DP1_7seg);
}

void Bfive(void) {
  GPIO_WriteLow(A1_7seg);
	GPIO_WriteHigh(B1_7seg);
	GPIO_WriteLow(C1_7seg);
	GPIO_WriteLow(D1_7seg);
	GPIO_WriteHigh(E1_7seg);
	GPIO_WriteLow(F1_7seg);
	GPIO_WriteLow(G1_7seg);
	GPIO_WriteHigh(DP1_7seg);
}

void Bsix(void) {
  GPIO_WriteLow(A1_7seg);
	GPIO_WriteHigh(B1_7seg);
	GPIO_WriteLow(C1_7seg);
	GPIO_WriteLow(D1_7seg);
	GPIO_WriteLow(E1_7seg);
	GPIO_WriteLow(F1_7seg);
	GPIO_WriteLow(G1_7seg);
	GPIO_WriteHigh(DP1_7seg);
}

void Bseven(void) {
  GPIO_WriteLow(A1_7seg);
	GPIO_WriteLow(B1_7seg);
	GPIO_WriteLow(C1_7seg);
	GPIO_WriteHigh(D1_7seg);
	GPIO_WriteHigh(E1_7seg);
	GPIO_WriteHigh(F1_7seg);
	GPIO_WriteHigh(G1_7seg);
	GPIO_WriteHigh(DP1_7seg);
}

void Beight(void) {
  GPIO_WriteLow(A1_7seg);
	GPIO_WriteLow(B1_7seg);
	GPIO_WriteLow(C1_7seg);
	GPIO_WriteLow(D1_7seg);
	GPIO_WriteLow(E1_7seg);
	GPIO_WriteLow(F1_7seg);
	GPIO_WriteLow(G1_7seg);
	GPIO_WriteHigh(DP1_7seg);
}

void Bnine(void) {
  GPIO_WriteLow(A1_7seg);
	GPIO_WriteLow(B1_7seg);
	GPIO_WriteLow(C1_7seg);
	GPIO_WriteHigh(D1_7seg);
	GPIO_WriteHigh(E1_7seg);
	GPIO_WriteLow(F1_7seg);
	GPIO_WriteLow(G1_7seg);
	GPIO_WriteHigh(DP1_7seg);
}

void printDigit(int x){

  int dig0 = x%10;
  int dig1 = x/10;

  switch (dig0){
    case 0: {Bzero();
             break;}
    case 1: {Bone();
             break;}
    case 2: {Btwo();
             break;}
    case 3: {Bthree();
             break;}
    case 4: {Bfour();
             break;}
    case 5: {Bfive();
             break;}
    case 6: {Bsix();
             break;}
    case 7: {Bseven();
             break;}
    case 8: {Beight();
             break;}
    case 9: {Bnine();
             break;}
    default: break;
  }
  switch (dig1){
    case 0: {Azero();
             break;}
    case 1: {Aone();
             break;}
    case 2: {Atwo();
             break;}
    case 3: {Athree();
             break;}
    case 4: {Afour();
             break;}
    case 5: {Afive();
             break;}
    case 6: {Asix();
             break;}
    case 7: {Aseven();
             break;}
    case 8: {Aeight();
             break;}
    case 9: {Anine();
             break;}
    default: break;
  }
}

