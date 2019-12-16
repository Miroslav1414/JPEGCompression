function rez = hafmenovKod(kod,tablica)
velicina = size(kod);
rez =[];
i=1;
while i < velicina(2)+1
    if kod(i) == 0
        rez = [rez [1,0,1,0]];
        break;
    end
    for j = 1:161
        if isequal(tablica(j,1),{kod(i)})
            rez = [rez tablica{j,2}];
            if kod(i) == 15.0
                i = i+1;
            else
                if kod(i+1)<0
                    rez = [rez double(complement(dec2bin(kod(i+1)*-1)))];
                else
                    rez = [rez dec2bin(kod(i+1))-48];
                end
                i=i+2;
            end
            break;
        end
    end
end

end