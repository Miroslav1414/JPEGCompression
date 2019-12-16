function B = dodaj128(A)

dimenzije = size(A);
dolje = dimenzije(1);
desno = dimenzije(2);

B = zeros(dolje,desno,3);
B = uint8(B);
for k=1:3
    for i=1:dolje
        for j=1:desno
            if A(i,j,k)  >0
                 B(i,j,k)= 128 + typecast(int8(A(i,j,k)),'uint8');
            else
                B(i,j,k)=  128 - 256 + typecast(int8(A(i,j,k)),'uint8');
            end
        
        end
    end
end

end