vsim main
add wave goHome clk ant next_ant pheromone
force clk 0 0, 1 25 -repeat 50
run 60000