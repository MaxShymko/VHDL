Library IEEE, work;
Use IEEE.std_logic_1164.all;
Use work.package1.all;

entity random is
	port(clk: in std_logic;
		max_val: in integer;
		result: out integer);
end random;

architecture struct of random is
signal tmp_num: integer := 1;
begin

	p1: process(tmp_num)
	begin
		tmp_num <= ((5**13)*(tmp_num)) mod (2**31-1);
	end process;

	p2: process(clk)
	begin
		if(clk'event and clk = '0') then
			result <= tmp_num mod max_val;
		end if;
	end process;
end struct;