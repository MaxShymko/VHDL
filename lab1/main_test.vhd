entity main_test is
end main_test;
architecture Behavior of main_test is
component main
port (x1,x2,x3,x4 : in BIT; y1,y2,y3 : out BIT);
end component;
signal x1,x2,x3,x4 : BIT;
signal y1,y2,y3 : BIT;
begin
p1 : main port map (x1 => x1, x2 => x2, x3 => x3, x4 => x4, y1 => y1, y2 => y2, y3 => y3);

x1 <= '0', 
      '1' after 400 ns,
      '0' after 800 ns;
      

x2 <= '0',
      '1' after 200 ns,
      '0' after 400 ns,
      '1' after 600 ns,
      '0' after 800 ns;
      
x3 <= '0', 
      '1' after 100 ns,
      '0' after 200 ns,
      '1' after 300 ns,
      '0' after 400 ns,
      '1' after 500 ns,
      '0' after 600 ns,
      '1' after 700 ns,
      '0' after 800 ns;
      
x4 <= '0', 
      '1' after 50 ns,
      '0' after 100 ns,
      '1' after 150 ns,
      '0' after 200 ns,
      '1' after 250 ns,
      '0' after 300 ns,
      '1' after 350 ns,
      '0' after 400 ns, 
      '1' after 450 ns,
      '0' after 500 ns,
      '1' after 550 ns,
      '0' after 600 ns,
      '1' after 650 ns,
      '0' after 700 ns,
      '1' after 750 ns,
      '0' after 800 ns;
      
end behavior;