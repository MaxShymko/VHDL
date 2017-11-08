package types is

	constant MATRIX_SIZE: natural := 5 + 2;

	type ant_arr is array (natural range 0 to 1) of integer range 0 to MATRIX_SIZE - 1;
	type ant_near_arr is array (natural range 0 to 7) of ant_arr;
	type pheromone_arr is array (natural range 0 to MATRIX_SIZE - 1, natural range 0 to MATRIX_SIZE - 1) of integer range -1 to 65535;
	type eat_arr is array (natural range 0 to MATRIX_SIZE - 1 - 2, natural range 0 to MATRIX_SIZE - 1 - 2) of boolean;

end types;
