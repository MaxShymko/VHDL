Library IEEE;
Use IEEE.std_logic_1164.all;

package package1 is

	constant dimension : natural := 5;


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
	variable result: integer range 0 to 2147483647;
	begin
		result := ((5**13)*(prev_num)) mod 2147483647;
		return result;
	end random;

	function getMod(num: integer; max_val: integer) return integer is
	variable result: integer range 0 to 7;
	begin
		case max_val is
			when 8 => result := num mod 8;
			when 7 => result := num mod 7;
			when 6 => result := num mod 6;
			when 5 => result := num mod 5;
			when 4 => result := num mod 4;
			when 3 => result := num mod 3;
			when 2 => result := num mod 2;
			when others => result := 0;
		end case;
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
