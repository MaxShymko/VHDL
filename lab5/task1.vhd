library work;
use work.package1.all;

entity task1 is
  port(
    mx : in matrix;
    func_sum, proc_sum : out integer
  );
end task1;

architecture struct of task1 is
begin
  func_sum <= func_getSum(mx);
  p1: process(mx)
    variable t_sum : integer;
  begin
    proc_getSum(mx, t_sum);
    proc_sum <= t_sum;
  end process p1; 
end struct;
