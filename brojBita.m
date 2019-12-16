function rez = brojBita(broj)
if broj<-511
    rez = 10;
elseif broj < -257
    rez = 9;
elseif broj < -127
    rez = 8;
elseif broj<-63
    rez = 7;
elseif broj<-31
    rez = 6;
elseif broj<-15
    rez = 5;
elseif broj<-7
    rez = 4;
elseif broj<-3
    rez = 3;
elseif broj<-1
    rez = 2;
elseif broj<2
    rez = 1; 
elseif broj<4 
    rez=2;
elseif broj<8 
    rez=3;
elseif broj<16 
    rez=4;
elseif broj<32 
    rez=5;
elseif broj<64 
    rez=6;
elseif broj<128 
    rez=7;
elseif broj<256 
    rez=8;
elseif broj<512
    rez = 9;
elseif broj == 0
    rez = 0;
else rez=10;
end
end