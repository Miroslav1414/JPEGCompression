function rez=kodovanje(niz)
poslednjiBroj =0;
for j= 1:64
    if niz(j) ~= 0
        poslednjiBroj = j;
    end
end
rez = [];
if( niz(1) ~= 0)
rez = brojBita(niz(1));
rez = [rez niz(1)];

brojNula =0.0;
for i = 2:poslednjiBroj;
    if brojNula == 48
        rez=[rez 15.0];
        rez=[rez 15.0];
        rez=[rez 15.0];
        brojNula =0.0;
    else
        if niz(i) == 0;
            brojNula = brojNula +1;
        else
            if brojNula <16
                rez = [rez (brojNula + brojBita(niz(i))/100)];
                rez = [rez niz(i)];
            elseif brojNula <32
                rez = [rez 15.0];
                brojNula = brojNula - 16;
                rez = [rez (brojNula + brojBita(niz(i))/100)];
                rez = [rez niz(i)];
            else
                rez = [rez 15.0];
                rez = [rez 15.0];
                brojNula = brojNula - 32;
                rez = [rez (brojNula + brojBita(niz(i))/100)];
                rez = [rez niz(i)];
            end
            brojNula = 0.0;
        end
    end
end
duzina = size(rez);

else
    %disp('kodovanje GRESKA');
end
rez = [rez 0.0];

end