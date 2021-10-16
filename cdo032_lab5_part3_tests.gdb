echo ======================================================\n
echo Running all tests..."\n\n


test "PINA: 0x01 => PORTB: 0, state = init"
set state = start
setPINA 0x01
continue 2
expectPORTB 0
expect state init
checkResult

test "PINA: 0x01, 0x00 => PORTB: 0x20, state = lights"
set state = start
setPINA 0x01
continue 2
setPINA 0x00
continue 2
expectPORTB 0x20
expect state lights
checkResult

test "PINA: 0x01, 0x00, 0x01, 0x00 => PORTB: 0x30, state = lights"
set state = start
setPINA 0x01
continue 2
setPINA 0x00
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
expectPORTB 0x30
expect state lights
checkResult

test "PINA: 0x01, 0x00, 0x01, 0x00, 0x01, 0x00 => PORTB: 0x38, state = lights"
set state = start
setPINA 0x01
continue 2
setPINA 0x00
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
expectPORTB 0x38
expect state lights
checkResult

test "PINA: 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00 => PORTB: 0x04, state = lights"
set state = start
setPINA 0x01
continue 2
setPINA 0x00
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
expectPORTB 0x04
expect state lights
checkResult

test "check if loops properly"
set state = start
setPINA 0x01
continue 2
setPINA 0x00
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
expectPORTB 0x00
expect state lights
checkResult

# Add tests below

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
