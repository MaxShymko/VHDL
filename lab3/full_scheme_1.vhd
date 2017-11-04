entity full_scheme_1 is
  generic (N : NATURAL := 4);
  port(c1,a1: in BIT;
    c2,c3,mc2,mc1: in BIT_VECTOR(0 to N-1);
    p2,mp2: out BIT;
    mp1: out BIT_VECTOR(0 to N-1));
end full_scheme_1;
architecture struct of full_scheme_1 is
component
  element port(c1,c2,c3,a1,mc2,mc1: in BIT;
    y2,my2,my1: out BIT);
end component;
signal t_y2,t_my2: BIT_VECTOR(0 to N-2);
begin
  cicr0: element port map(c1,c2(0),c3(0),a1,mc2(0),mc1(0),
    t_y2(0),t_my2(0),mp1(0));
  circ1: element port map(t_y2(0),c2(1),c3(1),t_my2(0),mc2(1),mc1(1),
    t_y2(1),t_my2(1),mp1(1));
  circ2: element port map(t_y2(1),c2(2),c3(2),t_my2(1),mc2(2),mc1(2),
    t_y2(2),t_my2(2),mp1(2));
  circ3: element port map(t_y2(2),c2(3),c3(3),t_my2(2),mc2(3),mc1(3),
    p2,mp2,mp1(3));
end struct;



