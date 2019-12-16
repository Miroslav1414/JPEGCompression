function rez = dekod2(niz,duzina)
rez = double(zeros(1,duzina));
velicina = size(niz)+1;
pozicija = 1;
i=1;

while(i<velicina(2))
   if( double(niz(i))==0)
       if( floor((pozicija-1)/64) == double((pozicija-1)/64))
           if(i==1 || niz(i-1)== 0)
               pozicija = pozicija +64;
               i = i+1;
           else
               i=i+1;
           end
       else
           pozicija = floor((pozicija + 63)/64) * 64 +1;
           i=i+1;
            
       end
   else
      if (floor(niz(i)) == 15) && (double(niz(i)) == 15)
          pozicija = pozicija + 16;
%         disp('ima 16 nula');
          i = i + 1;
      else
          if(floor(niz(i)) * 100  == 100 *niz(i) )
              rez(pozicija) =  niz(i+1);
              pozicija  = pozicija +1;
              i = i +2;
          else
              pozicija = pozicija + floor(niz(i));
              rez(pozicija) =  double(niz(i+1));
              pozicija  = pozicija +1;
              i = i +2;
          end
      end     
   end
  
end

end