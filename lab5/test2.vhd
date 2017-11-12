library work;
use work.package2.all;

entity test2 is
end test2;

architecture beh of test2 is
component task2 is
  port(
    mas : in massive;
    min : out integer
  );
end component;

signal mas : massive;
signal min : integer;

begin
  p: task2 port map(mas, min);
  mas <= 
    (1,2,3,4,5,6,7,8,9,10),
    (9,8,7,6,5,4,3,2,1,0) after 50 ns,
    (-30,-2,123,43,64,-1,-342,21,12,-9) after 100 ns;
end beh;
