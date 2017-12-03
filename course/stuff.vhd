Library IEEE, work;
Use IEEE.std_logic_1164.all;
Use work.package1.all;

entity stuff is
end stuff;

architecture struct of stuff is
signal result, t_result: integer := 1;
signal clk: std_logic;
begin
	
	p1: process(clk)
	begin
		t_result <= random(t_result);
		result <= getMod(t_result, 2);
	end process;

end struct;
