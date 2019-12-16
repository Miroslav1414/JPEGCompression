%ucitavanje slike i oduzimanje 128
% prelazak iz opsega 0:255 u -128:127
A = imread('slika250.bmp');
[desno,dolje,d3] = size(A);
B= oduzmi128(A);

%kvalitet q
q=20;

DCT = zeros(desno,dolje,3);

desno = floor(desno/8)*8;
dolje = floor(dolje/8)*8;

% % % % % %tablica za kodovanje
% % % % % tablica = generisiTablicu2();
% % % % % 
% % % % % dcR = [];
% % % % % hKodR = [];
% % % % % %kodR = 0;
% % % % % for i=1:8:desno
% % % % %     for j=1:8:dolje
% % % % %         DCT (i:i+7 , j:j+7) = dct2(B(i:i+7 , j:j+7, 1));
% % % % %             kv = kvant(DCT (i:i+7 , j:j+7), q, 0);
% % % % %             cik = cikcak(kv);
% % % % %             kodR = kodovanje(cik);
% % % % %             
% % % % %             velicina = size(kodR);
% % % % %             if(velicina(2)==1)
% % % % %                 dcR = [dcR 0];
% % % % %                 hKodR = [hKodR 1,0,1,0];
% % % % %             else
% % % % %                 dcR = [dcR kodR(2)];
% % % % %                 hKodR = [hKodR hafmenovKod(kodR(3:velicina(2)),tablica)];
% % % % %             end
% % % % %     end
% % % % % end


kodR = 0;
for i=1:8:desno
    for j=1:8:dolje
        DCT (i:i+7 , j:j+7) = dct2(B(i:i+7 , j:j+7, 1));
            kv = kvant(DCT (i:i+7 , j:j+7), q, 0);
            cik = cikcak(kv);
        if kodR == 0
            kodR = kodovanje(cik);
        else
            kodR = [kodR kodovanje(cik)];
        end
    end
end


kodB =0;
for i=1:8:desno
    for j=1:8:dolje
        DCT (i:i+7,j:j+7) = dct2(B(i:i+7,j:j+7,2));
            kv = kvant(DCT (i:i+7,j:j+7),q,0);
            cik = cikcak(kv);
        if kodB == 0
            kodB = kodovanje(cik);
        else
            kodB = [kodB kodovanje(cik)];
        end
    end
end
kodG =0;
for i=1:8:desno
    for j=1:8:dolje
        DCT (i:i+7,j:j+7) = dct2(B(i:i+7,j:j+7,3));
            kv = kvant(DCT (i:i+7,j:j+7),q,0);
            cik = cikcak(kv);
        if kodG == 0
            kodG = kodovanje(cik);
        else
            kodG = [kodG kodovanje(cik)];
        end
    end
end

%obrnuti postupak:



nizR = dekod2(kodR,dolje*desno);
nizB = dekod2(kodB,dolje*desno);
nizG = dekod2(kodG,dolje*desno);

matrica = zeros(desno,dolje,3);

k=1;
for i=1:8:desno
    for j=1:8:dolje
        matrica(i:i+7,j:j+7,1) = idct2(kvant(obrnutiCikcak(nizR(k:k+63)),q,1));
        k=k+64;
    end
    
end

k=1;
for i=1:8:desno
    for j=1:8:dolje
        matrica(i:i+7,j:j+7,2) = idct2(kvant(obrnutiCikcak(nizB(k:k+63)),q,1));
        k=k+64;
    end
end

k=1;
for i=1:8:desno
    for j=1:8:dolje
        matrica(i:i+7,j:j+7,3) = idct2(kvant(obrnutiCikcak(nizG(k:k+63)),q,1));
        k=k+64;
    end
end

%pretvori u int
matricaInt = int8(matrica);
slika2 = dodaj128(matricaInt);

subplot(1,2,1);
title('Orginalna slika')
imshow(A);
subplot(1,2,2);
title('Slika nakon kompresije i dekompresije')
imshow(slika2);

r=size(kodR);
b=size(kodB);
g=size(kodG);
kompresija = dolje*desno*3/(r(2)+b(2)+g(2));