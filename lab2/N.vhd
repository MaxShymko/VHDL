entity N is
port(A: in BIT; 
  Y: out BIT);
end N;
architecture N_arch of N is
begin
  Y <= (not A) after 1 ns;
end N_arch;
