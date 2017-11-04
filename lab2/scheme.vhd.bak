entity scheme is 
port(x4,x3,x2,x1: in BIT;
  y1,y3: inout BIT;
  y2,y4: out BIT);
end scheme; 

architecture str of scheme is 
---------------------------------------? 
component N 
port (A: in BIT; 
  Y: out BIT); 
end component; 
---------------------------------------? 
component A2
port (A, B: in BIT; 
  Y: out BIT); 
end component; 
---------------------------------------? 
component NO2
port (A, B: in BIT; 
  Y: out BIT); 
end component;
---------------------------------------? 
component NEX2
port (A, B: in BIT; 
  Y: out BIT); 
end component;
---------------------------------------? 
component NO3 
port (A,B,C: in BIT; 
  Y: out BIT); 
end component; 
---------------------------------------? 
component NAOA2 
port (A,B,C,D: in BIT; 
  Y: out BIT); 
end component; 
---------------------------------------? 
component NOA3 
port (A,B,C,D: in BIT; 
  Y: out BIT); 
end component;
---------------------------------------? 
component NA3O2 
port (A,B,C,D: in BIT; 
  Y: out BIT); 
end component;
---------------------------------------? 
component NAO2 
port (A,B,C: in BIT; 
  Y: out BIT); 
end component;
---------------------------------------? 

signal z1, z2, z3, z4, z5, z6, z7, z8, z9, z10, z11, z12, z13, z14, z15, z16: BIT;
begin
  met1: N port map(A=>x4, Y=>z1);
  met2: N port map(A=>y3, Y=>z2);
  met3: A2 port map(A=>z1, B=>x1, Y=>z3);
  met4: N port map(A=>z2, Y=>z4);
  met5: N port map(A=>z3, Y=>z5);
  met6: NO2 port map(A=>x4, B=>x2, Y=>z6);
  met7: N port map(A=>z5, Y=>z7);
  met8: NEX2 port map(A=>x3, B=>x2, Y=>z8);
  met9: NO3 port map(A=>z4, B=>x4, C=>x2, Y=>z9);
  met10: N port map(A=>x1, Y=>z10);
  met11: N port map(A=>x3, Y=>z11);
  met12: NAOA2 port map(A=>x2, B=>y1, C=>z1, D=>x1, Y=>z12);
  met13: NOA3 port map(A=>z6, B=>x1, C=>x3, D=>x4, Y=>z13);
  met14: N port map(A=>z8, Y=>z14);
  met15: N port map(A=>z7, Y=>z15);
  met16: NOA3 port map(A=>z9, B=>z10, C=>z11, D=>x4, Y=>z16);
  met17: NA3O2 port map(A=>z12, B=>z2, C=>x2, D=>z13, Y=>y4);
  met18: NO3 port map(A=>z14, B=>x4, C=>x1, Y=>y3);
  met19: NO2 port map(A=>x3, B=>z15, Y=>y2);
  met20: NAO2 port map(A=>z16, B=>z11, C=>z5, Y=>y1);
end str;
