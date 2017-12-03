vsim -novopt stuff
add wave clk result
force clk 0 0, 1 25 -repeat 50
run 10000