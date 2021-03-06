%Justin Austin
%Structures of Programming Language
%Dr. Li
%February 8

%Question 1
sum-up-numbers-simple([],0). %check to see if list is empty, if it is set to 0
sum-up-numbers-simple([A|Z],N) :- 
number(A), %takes argument A
sum-up-numbers-simple(Z,Summ),
N is A + Summ. %checks if element is a number, if so add it to the list 
sum-up-numbers-simple([A|Z],N) :-
\+number(A),sum-up-numbers-simple(Z,N). %if element is not a number move onto next element

%Question 2
sum-up-numbers-general([],0). %if list is empty return 0
sum-up-numbers-general([[]]),0). %if nested list is empty, return 0
sum-up-numbers-general([A|Z],N) :- %checks all elements in the list
number(A), %takes argument A
sum-up-numbers-general(Z,Summ), 
N is A + Summ. %if A is a number then add it to the total of numbers
sum-up-numbers-general([A|Z],N) :-
atom(A), %takes argument A
sum-up-numbers-general(Z,N). %if the element is a number then continue 
sum-up-numbers-general([A|Z],N) :-
sum-up-numbers-general(Z,Summ),
N is A+ Summ. %contniue to add recursively based on element 

%Question 3

%program declaration 
min-above-min (L!,L@,N):-
    listlen(L2, Length),
    Length < 1,
    minv_list(L1,N).
min-above-min(L1,_,N).
    listlen(L1, Length),
    Length < 1,
    N is -1.
min-above-min(L1,L2,N):-
    minv_list(L2,Min_of_L2),
    list_above(New_list, N).

%functions used to find the minmum element of the list

minv_list([Min],Min).
minv_list([H,K|T],M):-
    number(H),
    number(K),
    H=< K,
    minv_list([H|T],M).
    
minv_list([H,K|T],M):-
    number(H),
    number(K),
    H>K,
    minv_list([K|T],M).
    
minv_list([H,K|T],M):-
    not (number(H)),
    minv_list([K|T],M).
    
minv_list([H,K|T],M):-
    not (number(K)),
    minv_list([H|T],M).
    
%creates a new list that contains elements larger than min

list_above(Min,List,Min_list):-
	list_above_helper(Min,List,[],Min_list).

list_above_helper(_,List,Acc,Acc):-
	listlength(List,Length),
	Length<1.



list_above_helper(Min,[X|Y],Acc,Min_list):-
	not(number(X)),
	list_above_helper(Min, Y,Acc,Min_list).


list_above_helper(Min,List,Acc,Min_list):-
	listlength(List,Length),
	Length>0,
	[X|Y]=List,
	number(X),
	X>Min,
	list_above_helper(Min,Y,[X|Acc],Min_list ).

list_above_helper(Min,List,Acc,Min_list):-
	listlength(List,Length),
	Length>0,
	[X|Y] = List,
	number(X),
	X =<Min,
	list_above_helper(Min, Y, Acc, Min_list ).

listlength([],0).

listlength([_|Xs],L ):-
	listlength(Xs,N),
	L is N+1.


%Question 4

common-unique-elements ( [] ,_,[]). %checks to see if the list are empty
common-unique-elements([Z |L1], L2, [Z|L3]):- %z is head in List 1 & List 3
    member (L2,Z) ,! ,common-unique-elements (L1 ,L2,L3). %L2 is checked for the z variable
common-unique-elements( [_|L1], L2, L3):- 
    common-unique-elements ( L1, L2, L3).
member([Z|_],Z).
member([_|T], Z):- member(T,Z).
