function rez = deHafmen(kod,tablica)
rez =[];
trenutniKod = [];
velicina = size(kod);
i=1;

while  i<velicina(2)
    trenutniKod = [trenutniKod kod(i)];
    for j=1:161
        if isequal(tablica(j,2),{trenutniKod})
            rez = [rez tablica{j,1}];
            brojBita = tablica{j,1}*100 - floor(tablica{j,1}) * 100;
            
            if tablica{j,1} == 0;
                disp('nula');
                trenutniKod = [];
            else
            
            binarniBroj='';
            disp(['broj: ', num2str(i)]);
            
            for k=i+1:i+brojBita;
                binarniBroj = strcat(binarniBroj,num2str(kod(k)));
            end
            
            if kod(i+1) == 0;
                rez = [rez 0-bin2dec(binarniBroj)];
            else
                rez = [rez bin2dec(binarniBroj)];
                trenutniKod =[];
            end
            i=i+brojBita;
            end
        else
            
        end
    end
    i=i+1;
end

end