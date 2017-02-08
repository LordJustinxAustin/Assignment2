%Justin Austin
%Structures of Programming Language
%Dr. Li
%February 8

sum-up-numbers-simple([],0). %check to see if list is empty, if it is set to 0
sum-up-numbers-simple([A|Z],N) :- 
number(A),
sum-up-numbers-simple(Z,Summ),
N is A + Summ. %checks if element is a number, if so add it to the list 
sum-up-numbers-simple([A|Z],N) :-
\+number(A),sum-up-numbers-simple(Z,N). %if element is not a number move onto next element

