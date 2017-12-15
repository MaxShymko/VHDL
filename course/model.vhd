Library IEEE, work;
Use IEEE.std_logic_1164.all;
Use work.package1.all;

entity model is
	port(clk : in std_logic;
		start_eat : in eat_arr;
		ant : out ant_arr);
end model;

architecture struct of model is

signal next_ant : ant_arr := (0 => MATRIX_SIZE-2, 1 => MATRIX_SIZE-2); -- pos of ant

signal eat: eat_arr;

-- pheromone initialize
signal pheromone : pheromone_arr := (
	0 => (others => -1),
	MATRIX_SIZE-1 => (others => -1),
	others => (0 => -1, MATRIX_SIZE-1 => -1, others => 0)
	);

signal goHome : std_logic := '0';
signal initialize : std_logic := '0';

signal tmp_random_result: integer := 1;

signal t_next_ant: std_logic := '0';

begin

	NS: process(t_next_ant, start_eat)
		constant startPos : ant_arr := (0 => MATRIX_SIZE-2, 1 => MATRIX_SIZE-2); -- anthill
		variable ant_near : ant_near_arr; -- neighbor cells
		variable best_way : natural range 0 to 7; -- index of the ant_near
		variable equal_count : integer range 0 to 8 := 0;

		-- for random
		variable int_rand : integer range 0 to 7;
	begin

		if(initialize = '0') then
			if(isEatExist(start_eat) = '1') then
				eat <= start_eat;
				initialize <= '1';
			end if;
		--elsif(initialize = '1') then
		else
			-- next_ant sequence
			-- 7  6  4
			-- 5 ant 2 
			-- 3  1  0
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
			
			-- find first near cell /= -1
			for i in 0 to 7 loop
				if(pheromone(ant_near(i)(0),ant_near(i)(1)) >= 0) then
					best_way := i;
					exit;
				end if;
			end loop;
			equal_count := 0;

			if(goHome = '1') then

				-- hit on an anthill
				if(next_ant(0) = startPos(0) and next_ant(1) = startPos(1)) then
					goHome <= '0';

				else
					-- find the best way
					-- get all max values
					for i in 0 to 7 loop
						if(pheromone(ant_near(i)(0),ant_near(i)(1)) > pheromone(ant_near(best_way)(0),ant_near(best_way)(1))) then
							best_way := i;
						end if;
					end loop;

					-- get max values and update equal_count
					for i in 0 to 7 loop
						if(pheromone(ant_near(i)(0),ant_near(i)(1)) = pheromone(ant_near(best_way)(0),ant_near(best_way)(1))) then
							equal_count := equal_count + 1;
						end if;
					end loop;

					-- random choose from equals
	        		tmp_random_result <= random(tmp_random_result);
	        		int_rand := getMod(tmp_random_result, equal_count);

	        		for i in 0 to 7 loop
						if(pheromone(ant_near(i)(0),ant_near(i)(1)) = pheromone(ant_near(best_way)(0),ant_near(best_way)(1))) then
							if(int_rand = 0) then
								best_way := i;
								exit;
							else
								int_rand := int_rand - 1;
							end if;
						end if;
					end loop;

					-- decrement previous cell
					if(pheromone(next_ant(0), next_ant(1)) > 0) then
						pheromone(next_ant(0), next_ant(1)) <= pheromone(next_ant(0), next_ant(1)) - 1;
					end if;

					-- update next_state
					next_ant <= (ant_near(best_way)(0), ant_near(best_way)(1));
				end if;

			--elsif(goHome = '0') then
			else

				-- hit on food
				if(eat(next_ant(0)-1)(next_ant(1)-1) = '1') then
					goHome <= '1';
					eat(next_ant(0)-1)(next_ant(1)-1) <= '0';

				else
					-- find the best way
					-- get all min values
					for i in 0 to 7 loop
						if((pheromone(ant_near(i)(0),ant_near(i)(1)) <= pheromone(ant_near(best_way)(0),ant_near(best_way)(1))) and (pheromone(ant_near(i)(0),ant_near(i)(1)) /= -1)) then
							best_way := i;
							if(eat(ant_near(i)(0)-1)(ant_near(i)(1)-1) = '1') then
								exit;
							end if;
						end if;
					end loop;

					if(eat(ant_near(best_way)(0)-1)(ant_near(best_way)(1)-1) = '0') then
						-- get all min values and update equal_count
						for i in 0 to 7 loop
							if(pheromone(ant_near(i)(0),ant_near(i)(1)) = pheromone(ant_near(best_way)(0),ant_near(best_way)(1))) then
								equal_count := equal_count + 1;
							end if;
						end loop;

						-- random choose from equals
		        		tmp_random_result <= random(tmp_random_result);
	        			int_rand := getMod(tmp_random_result, equal_count);

		        		for i in 0 to 7 loop
							if(pheromone(ant_near(i)(0),ant_near(i)(1)) = pheromone(ant_near(best_way)(0),ant_near(best_way)(1))) then
								if(int_rand = 0) then
									best_way := i;
									exit;
								else
									int_rand := int_rand - 1;
								end if;
							end if;
						end loop;
					end if;

					-- inc two pheromone to cell
					pheromone(next_ant(0), next_ant(1)) <= pheromone(next_ant(0), next_ant(1)) + 2;

					-- update next_state
					next_ant <= (ant_near(best_way)(0), ant_near(best_way)(1));

				end if;
			end if;
		end if;
	end process;

	REG: process(clk)
	begin
		if(clk'event and clk = '1') then
			ant <= next_ant;
			t_next_ant <= not t_next_ant;
		end if;
	end process;

end struct;
