function matrica = obrnutiCikcak(niz)

matrica = zeros (8,8);

matrica(1,1) = niz(1);

 matrica(1,2) = niz(2);
 matrica(2,1) = niz(3);

 matrica(3,1) = niz(4);
 matrica(2,2) = niz(5);
 matrica(1,3) = niz(6);

 matrica(1,4) = niz(7);
 matrica(2,3) = niz(8);
 matrica(3,2) = niz(9);
 matrica(4,1) = niz(10);

 matrica(5,1) = niz(11);
 matrica(4,2) = niz(12);
 matrica(3,3) = niz(13);
 matrica(2,4) = niz(14);
 matrica(1,5) = niz(15);

 matrica(1,6) = niz(16);
 matrica(2,5) = niz(17);
 matrica(3,4) = niz(18);
 matrica(4,3) = niz(19);
 matrica(5,2) = niz(20);
 matrica(6,1) = niz(21);

 matrica(7,1) = niz(22);
 matrica(6,2) = niz(23);
 matrica(5,3) = niz(24);
 matrica(4,4) = niz(25);
 matrica(3,5) = niz(26);
 matrica(2,6) = niz(27);
 matrica(1,7) = niz(28);

 matrica(1,8) = niz(29);
 matrica(2,7) = niz(30);
 matrica(3,6) = niz(31);
 matrica(4,5) = niz(32);
 matrica(5,4) = niz(33);
 matrica(6,3) = niz(34);
 matrica(7,2) = niz(35);
 matrica(8,1) = niz(36);

 matrica(8,2) = niz(37);
 matrica(7,3) = niz(38);
 matrica(6,4) = niz(39);
 matrica(5,5) = niz(40);
 matrica(4,6) = niz(41);
 matrica(3,7) = niz(42);
 matrica(2,8) = niz(43);

 matrica(3,8) = niz(44);
 matrica(4,7) = niz(45);
 matrica(5,6) = niz(46);
 matrica(6,5) = niz(47);
 matrica(7,4) = niz(48);
 matrica(8,3) = niz(49);

 matrica(8,4) = niz(50);
 matrica(7,5) = niz(51);
 matrica(6,6) = niz(52);
 matrica(5,7) = niz(53);
 matrica(4,8) = niz(54);

 matrica(5,8) = niz(55);
 matrica(6,7) = niz(56);
 matrica(7,6) = niz(57);
 matrica(8,5) = niz(58);

 matrica(8,6) = niz(59);
 matrica(7,7) = niz(60);
 matrica(6,8) = niz(61);

 matrica(7,8) = niz(62);
 matrica(8,7) = niz(63);

 matrica(8,8) = niz(64);
end