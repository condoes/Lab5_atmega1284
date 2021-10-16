/*	Author: Cindy Do
 *  Partner(s) Name: 
 *	Lab Section: 23
 *	Assignment: Lab #5  Exercise #3
 *	Exercise Description: festive lights display with 6 LEDS CONNECTED TO PORT pb5...pb0
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

enum States {start, init, lights} state;
unsigned char tmpB = 0x00;

unsigned char tmpA = 0x0;
unsigned char i = 0;
void Tick() {
unsigned char arr[11] = {0x00, 0x20, 0x30, 0x38, 0x04, 0x06, 0x7, 0x1E, 0x2D, 0x33, 0x3F};

tmpB = PORTB;
tmpA = ~PINA & 0x01;


    switch(state) {
        case start: 
            PORTB = arr[0];
            i = 1;
            state = init; 
            break;
        
        case init: 
	    tmpA = ~PINA & 0x01;
            if(tmpA == 1) {
                state = lights;
                 if(i < 11) {
                    PORTB = arr[i];
                    i += 1;
                }
                if(i >= 11) {
                    i = 0;
                }
            }
            if(tmpA == 0){
                state = init;
            }
            break;

        case lights: 
	        tmpA = ~PINA & 0x01;
            if(tmpA == 0) {
                state = init;
            }
            if(tmpA == 1){
                state = lights;
            }
            
            break;

        default:
            state = start;
            break;
    }
}

int main(void) {
    /* Insert DDR and PORT initializations */
	DDRA = 0x00; PORTA = 0xFF;
	DDRB = 0xFF; PORTB = 0x00;

    while (1) {
        Tick();
    }
    return 1;
}