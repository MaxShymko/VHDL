library work;
use work.package2.all;

entity task2 is
  port(
    mas : in massive;
    min : out integer
  );
end task2;

architecture struct of task2 is
begin
  min <= func_getMin(mas);
end struct;
