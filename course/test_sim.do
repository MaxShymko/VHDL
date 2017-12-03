vsim -novopt test
add wave clk ant
force clk 0 0, 1 25 -repeat 50
run 60000