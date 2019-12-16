%ucitavanje slike i oduzimanje 128
% prelazak iz opsega 0:255 u -128:127
A = imread('cuko.jpg');
[desno,dolje,d3] = size(A);
B= oduzmi128(A);

%kvalitet q
q=16;

DCT = zeros(desno,dolje,3);

desno = floor(desno/8)*8;
dolje = floor(dolje/8)*8;



kodR = [];
for i=1:8:desno
    for j=1:8:dolje
        DCT (i:i+7 , j:j+7) = dct2(B(i:i+7 , j:j+7, 1));
            kv = kvant(DCT (i:i+7 , j:j+7), q, 0);
            cik = cikcak(kv);
            kodR = [kodR cik];
        
    end
end


kodB =[];
for i=1:8:desno
    for j=1:8:dolje
        DCT (i:i+7 , j:j+7) = dct2(B(i:i+7 , j:j+7,2));
            kv = kvant(DCT (i:i+7,j:j+7),q,0);
            cik = cikcak(kv);
            kodB = [kodB  cik];
        
    end
end

kodG =[];
for i=1:8:desno
    for j=1:8:dolje
        DCT (i:i+7,j:j+7) = dct2(B(i:i+7,j:j+7,3));
            kv = kvant(DCT (i:i+7,j:j+7),q,0);
            cik = cikcak(kv);
            kodG = [kodG  cik];
       
    end
end

%obrnuti postupak:



nizR = kodR;
nizB = kodB;
nizG = kodG;

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