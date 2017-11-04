entity NAO2 is 
port(A, B, C: in BIT;
  Y: out BIT);
end NAO2;

architecture NAO2_arch of NAO2 is 
begin 
  Y <= (not (A and (B or C))) after 3 ns; 
end NAO2_arch;