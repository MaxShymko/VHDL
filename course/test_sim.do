vsim -coverage -novopt work.test
add wave clk ant eat
force clk 0 0, 1 25 -repeat 50
run 1000000
coverage report -html -htmldir covhtmlreport -threshL 50 -threshH 90