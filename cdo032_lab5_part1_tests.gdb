echo ======================================================\n
echo Running all tests..."\n\n

# Add tests below
-------------------
test "PINA: 0xFE, PINB: 0x01 => PORTC: 2"
# Set inputs
setPINA 0xFE
setPINB 0x01
# Continue for several ticks
continue 2
# Set expect values
expectPORTC 2
# Check pass/fail
checkResult

test "PINA: 0xF0, PINB: 0x0F => PORTC: 8"
# Set inputs
setPINA 0xF0
setPINB 0x0F
# Continue for several ticks
continue 2
# Set expect values
expectPORTC 8
# Check pass/fail
checkResult

test "PINA: 0xF5, PINB: 0xB => PORTC: 5"
# Set inputs
setPINA 0xF5
setPINB 0x0B
# Continue for several ticks
continue 2
# Set expect values
expectPORTC 5
# Check pass/fail
checkResult

test "PINA: 0x00, PINB: 0xFF => PORTC: 016"
# Set inputs
setPINA 0x00
setPINB 0xFF
# Continue for several ticks
continue 2
# Set expect values
expectPORTC 16
# Check pass/fail
checkResult

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n