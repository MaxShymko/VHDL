vsim -coverage -novopt work.test
add wave clk ant
force clk 0 0, 1 25 -repeat 50
run 10000
coverage report -html -htmldir covhtmlreport -threshL 50 -threshH 90