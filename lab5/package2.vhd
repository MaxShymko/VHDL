package package2 is
  constant N : natural := 10; -- array length
  type massive is array (natural range 0 to N-1) of integer;
  function func_getMin (mas: massive) return integer;
end package2;

package body package2 is
  
  function func_getMin (mas: massive) return integer is
    variable min : natural := 0;
  begin
    for i in 1 to N-1 loop
      if(mas(i) < mas(min)) then
        min := i;
      end if;
    end loop;
    return mas(min);
  end func_getMin;

end package2;
