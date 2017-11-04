vsim scheme_1
add wave TE TI D C QN
force C 0 0, 1 25 -repeat 50
force D 0 0, 1 50 -repeat 100
force TI 0 0, 1 100 -repeat 200
force TE 0 0, 1 200 -repeat 400
run 800