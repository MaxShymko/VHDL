entity main is
	port(clk : in bit);
end main;

architecture struct of main is

constant MATRIX_SIZE: natural := 5 + 2;

type ant_arr is array (natural range 0 to 1) of integer range 0 to MATRIX_SIZE - 1;
type pheromone_arr is array (natural range 0 to MATRIX_SIZE - 1, natural range 0 to MATRIX_SIZE - 1) of integer;
type ant_near_arr is array (natural range 0 to 7) of ant_arr;

signal ant, startPos : ant_arr;
signal pheromone : pheromone_arr;
signal goHome : boolean;

begin
	pheromone <= (
		0 => (others => -1),
		1 => (1=>1,2=>2,3=>3,4=>1,5=>1,others => -1),
		2 => (1=>1,2=>2,3=>4,4=>2,5=>3,others => -1),
		3 => (1=>0,2=>2,3=>0,4=>5,5=>3,others => -1),
		4 => (1=>0,2=>0,3=>0,4=>6,5=>0,others => -1),
		5 => (1=>0,2=>0,3=>0,4=>3,5=>7,others => -1),
		6=> (others => -1)
	);
	goHome <= true;
	startPos <= (0=>MATRIX_SIZE - 2, 1=>MATRIX_SIZE - 2);

	main_process: process(clk)
	variable ant_near : ant_near_arr;
	variable best_way : natural range 0 to 7;


	begin

		if(clk'event and clk = '1') then
			ant_near(0)(0) := ant(0) + 1; ant_near(0)(1) := ant(1) + 1;
			ant_near(1)(0) := ant(0) + 1; ant_near(1)(1) := ant(1);
			ant_near(2)(0) := ant(0);     ant_near(2)(1) := ant(1) + 1;
			ant_near(3)(0) := ant(0) + 1; ant_near(3)(1) := ant(1) - 1;
			ant_near(4)(0) := ant(0) - 1; ant_near(4)(1) := ant(1) + 1;
			ant_near(5)(0) := ant(0);     ant_near(5)(1) := ant(1) - 1;
			ant_near(6)(0) := ant(0) - 1; ant_near(6)(1) := ant(1);
			ant_near(7)(0) := ant(0) - 1; ant_near(7)(1) := ant(1) - 1;
			
			if(goHome) then
				best_way := 0;

				for i in 1 to 7 loop
					if(pheromone(ant_near(i)(0),ant_near(i)(0)) > pheromone(ant_near(i-1)(0),ant_near(i-1)(0))) then
						best_way := i;
					end if;
				end loop;

				if(pheromone(ant(0),ant(1)) > 0) then
					--pheromone(ant(0),ant(1)) <= pheromone(ant(0),ant(1)) - 1;
				end if;

				ant <= (ant_near(best_way)(0), ant_near(best_way)(1));
			else

			end if;

		end if;
	end process;
end struct;
