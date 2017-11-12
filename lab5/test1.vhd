library work;
use work.package1.all;

entity test1 is
end test1;

architecture beh of test1 is
component task1 is
  port(
    mx : in matrix;
    func_sum, proc_sum : out integer
  );
end component;

signal mx : matrix;
signal func_sum : integer;
signal proc_sum : integer;

begin
  p: task1 port map(mx, func_sum, proc_sum);
  mx <= (
    (1, 2, 3, 4, 5),
    (1, 2, 3, 4, 5),
    (1, 2, 3, 4, 5),
    (1, 2, 3, 4, 5),
    (1, 2, 3, 4, 5)
  ),
  (
    (12, 54, 76, 12, 5),
    (33, 8, 32, 12, 34),
    (-100, 1, 50, 100, 54),
    (34, 23, 54, 17, 46),
    (-53, -2, -3, -4, -17) 
  ) after 50 ns;
end beh;
