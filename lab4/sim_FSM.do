vsim FSM_A
add wave clk z state NEXT_state w
force z z1 0, z2 50, z3 100 -repeat 150
force clk 0 0, 1 25 -repeat 50
view wave
run 400
