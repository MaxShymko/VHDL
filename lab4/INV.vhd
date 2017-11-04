Library IEEE;
Use IEEE.std_logic_1164.all;

entity INV is
port (x : in std_logic;
      y : out std_logic);
end INV;
architecture struct of INV is
begin
  y <= not x after 1 ns;
end struct;
