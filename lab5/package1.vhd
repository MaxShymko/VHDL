package package1 is
  constant N : natural := 5; -- matrix demension
  type matrix is array (natural range 0 to N-1, natural range 0 to N-1) of integer range -100 to 100;
  function func_getSum (mx: matrix) return integer;
  procedure proc_getSum (mx: in matrix; sum: out integer);
end package1;

package body package1 is
  
  function func_getSum (mx: matrix) return integer is
    variable sum : integer := 0;
  begin
    for i in 0 to N-1 loop
      sum := sum + mx(i, i);
    end loop;
    return sum;
  end func_getSum;

  procedure proc_getSum (mx: in matrix; sum: out integer) is
    variable t_sum : integer := 0; 
  begin
    for i in 0 to N-1 loop
      t_sum := t_sum + mx(i, i);
    end loop;
    sum := t_sum;
  end proc_getSum;

end package1;
