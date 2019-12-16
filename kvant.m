function rez = kvant(matrica,kvalitet,dekvantovanje)
Q = zeros(8,8);
for i=1:8
    for j=1:8
        Q(i,j) = 1+ (1+i+j)*kvalitet;
    end
end

Q2 = ([ 
            3  5  7  9  11 13 15 17;
            5  7  9  11 13 15 17 19;
            7  9  11 13 15 17 19 21;
            9  11 13 15 17 19 21 23;
            11 13 15 17 19 21 23 25;
            13 15 17 19 21 23 25 27;
            15 17 19 21 23 25 27 29;
            17 19 21 23 25 27 29 31;]);

if dekvantovanje == 1
    rez = matrica.*Q;
else
    rez = round(matrica./Q);
end

end