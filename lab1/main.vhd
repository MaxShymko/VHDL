entity main is 
port (x1,x2,x3,x4 : in BIT; y1,y2,y3 : out BIT);
end main;
architecture struct of main is
begin
  
  y1 <= 
  ((not x1) and x2 and (not x3) and (not x4)) or 
  (x1 and x3 and (not x4)) or 
  (x1 and x2 and x3);
  
  y2 <= 
  ((not x1) and x2 and (not x3) and x4) or 
  (x1 and x2 and x3 and x4) or 
  ((not x1) and (not x2) and x3) or 
  ((not x1) and x3 and (not x4)) or 
  (x1 and (not x2) and (not x3)) or 
  (x1 and (not x3) and (not x4));
  
  y3 <= 
  ((not x1) and (not x2) and x3 and x4) or 
  (x1 and (not x2) and (not x3) and x4) or 
  (x1 and x2 and (not x3) and (not x4));
end struct;
