Library IEEE;
Use IEEE.std_logic_1164.all;

entity NOAA is
port (x1,x2,x3,x4 : in std_logic;
      y : out std_logic);
end NOAA;
architecture struct of NOAA is
begin
  y <= not ((x1 and x2) xor (x3 and x4)) after 3 ns;
end struct;