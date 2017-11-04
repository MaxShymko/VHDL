entity NOA3 is 
port(A,B,C,D: in BIT; 
  Y: out BIT); 
end NOA3; 
architecture NOA3_arch of NOA3 is 
begin 
  Y <= (not(A or (B and C and D))) after 5 ns; 
end NOA3_arch;
