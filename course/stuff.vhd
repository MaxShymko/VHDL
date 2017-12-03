Library IEEE, work;
Use IEEE.std_logic_1164.all;
Use work.package1.all;

entity stuff is
end stuff;

architecture struct of stuff is
component random is
	port(clk: in std_logic;
		max_val: in integer;
		result: out integer);
end component random;

signal result: integer := 1;
signal clk: std_logic;
begin
	
	p1: random port map (clk, 10, result);

end struct;
