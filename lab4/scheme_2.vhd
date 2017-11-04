Library IEEE;
Use IEEE.std_logic_1164.all;

entity scheme_2 is
  port(D,TI,TE,C : in std_logic;
  QN : out std_logic);
end scheme_2;
architecture struct of scheme_2 is
signal next_bit: std_logic;
begin
  p1: process(C, TE)
    begin
    if (C'event and C = '1') then
      if (TE = '1') then
        QN <= (not TI);
      elsif (TE = '0') then
        QN <= (not D);
      else
        null;
      end if;
    end if;   
  end process;
end struct;