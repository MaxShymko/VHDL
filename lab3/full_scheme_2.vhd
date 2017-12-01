entity full_scheme_2 is
  generic (N : NATURAL := 4);
  port(c1,a1: in BIT;
    c2,c3,mc2,mc1: in BIT_VECTOR(0 to N-1);
    p2,mp2: out BIT;
    mp1: out BIT_VECTOR(0 to N-1));
end full_scheme_2;
architecture struct of full_scheme_2 is
component
  element port(c1,c2,c3,a1,mc2,mc1: in BIT;
    y2,my2,my1: out BIT);
end component;
signal t_y2,t_my2: BIT_VECTOR(0 to N);
begin
  t_y2(0) <= c1;
  t_my2(0) <= a1;
  
  met1: for i in 0 to N-1 generate
    i_bit_slice: element port map(t_y2(i),c2(i),c3(i),t_my2(i),mc2(i),mc1(i),
      t_y2(i+1),t_my2(i+1),mp1(i));
  end generate met1;
  
  p2 <= t_y2(N);
  mp2 <= t_my2(N);
end struct;

