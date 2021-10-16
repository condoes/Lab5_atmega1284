#Test file for "Lab4"

echo ======================================================\n
echo Running all tests..."\n\n

# Test sequence from init to incr => PORTB: 8
test "PINA: 0xFE => PORTB: 8, state: incr"
set state = init
setPINA 0xFE
expect state incr
expect PORTB 8
checkResult

# Test sequence from init to incr to decr => PORTB: 7
test "PINA: 0xFE, 0xFD => PORTB: 7, state: decr"
set state = init
setPINA 0xFE
expect state incr
expect PORTB 8
setPINA 0xFD
expect state decr
expect PORTB 7
checkResult

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n