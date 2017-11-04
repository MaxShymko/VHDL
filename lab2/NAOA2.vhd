entity NAOA2 is 
port(A, B, C, D: in BIT; 
  Y: out BIT); 
end NAOA2;

architecture NAOA2_arch of NAOA2 is 
begin 
  Y <= (not(A and (B or (C and D)))) after 4 ns;
end NAOA2_arch;