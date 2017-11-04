entity NA3O2 is 
port(A,B,C,D: in BIT; 
  Y: out BIT); 
end NA3O2;

architecture NA3O2_arch of NA3O2 is 
begin 
  Y <= (not ((A and B) and (C or D))) after 4 ns; 
end NA3O2_arch;