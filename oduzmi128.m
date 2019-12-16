function B = oduzmi128(A) 
dimenzije = size(A);
dolje = dimenzije(1);
desno = dimenzije(2);

B = zeros(dolje,desno,3);
B = int8(B);
for k=1:3
    for i=1:dolje
        for j=1:desno
            if A(i,j,k) <127 
                
                 B(i,j,k)= -128 + typecast(uint8(A(i,j,k)),'int8');
        
            else
                %128 = -128, 129 = -127 ...
                B(i,j,k) = 128 + typecast(uint8(A(i,j,k)),'int8');
            end
        end
    end
end
end