%Justin Austin
%Structures of Programming Language
%Dr. Li
%February 8

sum-up-numbers-simple([],0).
sum-up-numbers-simple([A|Z],N) :-
number(A),
sum-up-numbers-simple(Z,Summ),
N is A + Summ.

