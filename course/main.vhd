Library IEEE, work;
Use IEEE.std_logic_1164.all;
Use work.types.all;
Use STD.textio.all; -- file
entity main is
	port(clk : in std_logic;
		ant : out ant_arr);
end main;

architecture struct of main is

signal next_ant : ant_arr := (0=>MATRIX_SIZE-2, 1=>MATRIX_SIZE-2); -- pos of ant
signal startPos : ant_arr := (0=>MATRIX_SIZE-2, 1=>MATRIX_SIZE-2); -- anthill
signal pheromone : pheromone_arr := (
	0 => (others => -1),
	1 => (1=>1,2=>2,3=>3,4=>1,5=>1,others => -1),
	2 => (1=>1,2=>2,3=>4,4=>2,5=>3,others => -1),
	3 => (1=>0,2=>2,3=>0,4=>5,5=>3,others => -1),
	4 => (1=>0,2=>0,3=>0,4=>6,5=>0,others => -1),
	5 => (1=>0,2=>0,3=>0,4=>3,5=>7,others => -1),
	6 => (others => -1)
	);
--signal pheromone : pheromone_arr;

signal eat : eat_arr := (
	0 => (true, false,false,false,true ),
	1 => (false,false,false,false,false),
	2 => (false,false,true, false,false),
	3 => (false,false,false,false,false),
	4 => (true, false,false,false,false)
	);
signal goHome : boolean := false;

begin

	main_process: process(clk)

	-- file declarations
	variable outdata_line : line;
	file output_data_file : text open write_mode is "results.txt";
	--

	variable ant_near : ant_near_arr;
	variable best_way : natural range 0 to 7;
	variable initialize : boolean := false;

	begin

		
		if(initialize = false) then
			initialize := true;

			-- pheromone initialize
--			for i in 0 to MATRIX_SIZE-1 loop
--				for j in 0 to MATRIX_SIZE-1 loop
--					if(i = 0 or j = 0 or i = MATRIX_SIZE-1 or j = MATRIX_SIZE-1) then
--						pheromone(i, j) <= -1;
--					else
--						pheromone(i, j) <= 0;
--					end if;
--				end loop;
--			end loop;

			-- first string in a file: Elements count: (MATRIX_SIZE-2)^2 - eat, 0 - false, 1 - true
			for i in 0 to MATRIX_SIZE-1-2 loop
				for j in 0 to MATRIX_SIZE-1-2 loop
					if(eat(i,j) = true) then
						write(outdata_line, 1);
					else
						write(outdata_line, 0);
					end if;
					write(outdata_line, string'(" "));
				end loop;
			end loop;
			writeline(output_data_file,outdata_line);
			-- second line in a file: Elements count: (MATRIX_SIZE)^2 - pheromone
			for i in 0 to MATRIX_SIZE-1 loop
				for j in 0 to MATRIX_SIZE-1 loop
					write(outdata_line, pheromone(i,j));
					write(outdata_line, string'(" "));
				end loop;
			end loop;
			writeline(output_data_file,outdata_line);

			write(outdata_line,startPos(0));
			write(outdata_line,string'(" "));
			write(outdata_line,startPos(1));
			writeline(output_data_file,outdata_line);
		end if;
		--

		if(clk'event and clk = '0') then
			ant_near := (
				0 => (next_ant(0) + 1, next_ant(1) + 1),
				1 => (next_ant(0) + 1, next_ant(1)),
				2 => (next_ant(0),     next_ant(1) + 1),
				3 => (next_ant(0) + 1, next_ant(1) - 1),
				4 => (next_ant(0) - 1, next_ant(1) + 1),
				5 => (next_ant(0),     next_ant(1) - 1),
				6 => (next_ant(0) - 1, next_ant(1)),
				7 => (next_ant(0) - 1, next_ant(1) - 1)
				);
			
			for i in 0 to 7 loop
				if(pheromone(ant_near(i)(0),ant_near(i)(1)) >= 0) then
					best_way := i;
					exit;
				end if;
			end loop;

			if(goHome = true) then

				if(next_ant(0) = startPos(0) and next_ant(1) = startPos(1)) then -- hit on an anthill
					goHome <= false;

				else
					for i in 1 to 7 loop
						if(pheromone(ant_near(i)(0),ant_near(i)(1)) > pheromone(ant_near(best_way)(0),ant_near(best_way)(1))) then
							best_way := i;
						end if;
					end loop;

					if(pheromone(next_ant(0), next_ant(1)) > 0) then
						pheromone(next_ant(0), next_ant(1)) <= pheromone(next_ant(0), next_ant(1)) - 1;
					end if;

					next_ant <= (ant_near(best_way)(0), ant_near(best_way)(1));
				end if;

			elsif(goHome = false) then
				if(eat(next_ant(0)-1,next_ant(1)-1) = true) then -- hit on an food
					goHome <= true;
					eat(next_ant(0)-1,next_ant(1)-1) <= false;

				else

					for i in 1 to 7 loop
						if((pheromone(ant_near(i)(0),ant_near(i)(1)) <= pheromone(ant_near(best_way)(0),ant_near(best_way)(1))) and (pheromone(ant_near(i)(0),ant_near(i)(1)) /= -1)) then
							best_way := i;
						end if;
					end loop;

					pheromone(next_ant(0), next_ant(1)) <= pheromone(next_ant(0), next_ant(1)) + 2;

					next_ant <= (ant_near(best_way)(0), ant_near(best_way)(1));
				end if;
			end if;

		elsif(clk'event and clk = '1') then
			ant <= next_ant;
			
			-- result logger
			write(outdata_line,next_ant(0));
			write(outdata_line,string'(" "));
			write(outdata_line,next_ant(1));
			writeline(output_data_file,outdata_line);
			--
		end if;
	end process;
end struct;
