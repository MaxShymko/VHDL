Library IEEE;
Use IEEE.std_logic_1164.all;

package package1 is

	constant dimension : natural := 4;


	constant MATRIX_SIZE: natural := dimension + 2;

	type ant_arr is array (natural range 0 to 1) of integer range 0 to MATRIX_SIZE - 1;
	type ant_near_arr is array (natural range 0 to 7) of ant_arr;
	type pheromone_arr is array (natural range 0 to MATRIX_SIZE - 1, natural range 0 to MATRIX_SIZE - 1) of integer range -1 to 32767;
	type eat_arr is array (natural range 0 to MATRIX_SIZE - 1 - 2) of std_logic_vector(0 to MATRIX_SIZE - 1 - 2);

	function random(prev_num: integer) return integer;
	function getMod(num: integer; max_val: integer) return integer;
	function isEatExist(eat: eat_arr) return std_logic;

end package1;

package body package1 is

	function random(prev_num: integer) return integer is
	constant a: integer := 16807;
	constant m: integer := 2147483647;
	begin
		return ((5**13)*(prev_num)) mod 1073741824;
	end random;

	function getMod(num: integer; max_val: integer) return integer is
	variable t_num: integer range -8 to 7 := 0;
	variable result: integer range 0 to 7 := 0;
	begin
		t_num := num mod 8;

		for i in 0 to 7 loop
			if(t_num < 0) then
				exit;
			end if;
			result := t_num;
			t_num := t_num - max_val;
		end loop;
		
		return result;
	end getMod;

	-- return 0 if there is no eat
	function isEatExist(eat: eat_arr) return std_logic is
	variable result: std_logic := '0';
	begin
		for i in 0 to MATRIX_SIZE-1-2 loop
			for j in 0 to MATRIX_SIZE-1-2 loop
				if(eat(i)(j) = '1') then
					result := '1';
				end if;
			end loop;
		end loop;
		return result;
	end isEatExist;

end package body package1;
