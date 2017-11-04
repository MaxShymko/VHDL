Library IEEE;
Use IEEE.std_logic_1164.all;

entity scheme_1 is
  port(D,TI,TE,C : in std_logic;
  QN : out std_logic);
end scheme_1;
architecture struct of scheme_1 is
component INV
port (x : in std_logic;
      y : out std_logic);
end component;
component NOAA
port (x1,x2,x3,x4 : in std_logic;
      y : out std_logic);
end component;
signal NTE,y1,NC,NNC,y2,Ny2,y3,Ny3: std_logic;
begin
  x8: INV port map(TE,NTE);
  x7: NOAA port map(D,NTE,TI,TE,y1);
  x5: INV port map(C,NC);
  x6: INV port map(NC,NNC);
  x1: NOAA port map(Ny2,NNC,y1,NC,y2);
  x2: INV port map(y2,Ny2);
  x3: NOAA port map(Ny3,NC,Ny2,NNC,y3);
  x4: INV port map(y3,Ny3);
  x9: INV port map(y3,QN);
end struct;