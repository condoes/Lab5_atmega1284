/*	Author: Cindy Do
 *  Partner(s) Name: 
 *	Lab Section: 23
 *	Assignment: Lab #5  Exercise #1
 *	Exercise Description: A car has a fuel-level sensor that sets PA3..PA0 to a value between 0 (empty) and 15 (full). A series of LEDs connected to PC5..PC0 should light to graphically indicate the fuel level. If the fuel level is 1 or 2, PC5 lights. If the level is 3 or 4, PC5 and PC4 light. Level 5-6 lights PC5..PC3. 7-9 lights PC5..PC2. 10-12 lights PC5..PC1. 13-15 lights PC5..PC0. Also, PC6 connects to a "Low fuel" icon, which should light if the level is 4 or less. 
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

int main(void) {
    /* Insert DDR and PORT initializations */
	DDRA = 0x00; PORTA = 0xFF;
	DDRC = 0XFF; PORTC = 0x00;
    unsigned char fuelLvl = 0x0;
    unsigned char tmpC = 0x0;
	

    /* Insert your solution below */
    while (1) {
        fuelLvl = ~PINA & 0x0F;

        if(fuelLvl == 0) {
            tmpC = 0x40;
        }
        if(fuelLvl == 0x1 || fuelLvl == 0x2) {
            tmpC = 0x60;
        }
        if(fuelLvl == 0x3 || fuelLvl == 0x4) {
            tmpC = 0x70;
        }
        if( fuelLvl == 0x5 || fuelLvl == 0x6) {
            tmpC = 0x38;
        }
        if( fuelLvl == 0x7 || fuelLvl == 0x8 || fuelLvl == 0x9) {
            tmpC = 0x3C;
        }
        if( fuelLvl == 0xA || fuelLvl == 0xB || fuelLvl == 0xC) {
            tmpC = 0x3E;
        }
        if( fuelLvl == 0xD || fuelLvl == 0xE || fuelLvl == 0xF) {
            tmpC = 0x3F;
        }

        PORTC = tmpC;

    }
    return 1;
}