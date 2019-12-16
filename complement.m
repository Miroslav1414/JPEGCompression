function rez = complement(a)
c1 = not(a-'0');   % one's complement
% d=1;
% for k=numel(a):-1:1
%   r=d & c1(k);
%   c2(1,k)=xor(d,c1(k));  % c2 is two's complement
%   d=r;
% end
rez = (c1);
end