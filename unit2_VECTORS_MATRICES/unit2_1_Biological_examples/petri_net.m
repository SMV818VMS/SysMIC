%Petri Nets and stoichiometry matrices %

% Exercise 1.1.1A:
% If n0 = 9, how many R and R2 will be after 2 dimerizations and 1
% monomerization

r = 9;
r_two = 0;

% dimerizations
r = r-2*2;
r_two = 2*1;

% 1 monomerization
r_two = r_two-1
r = r+1*2

% Exercise 1.1.1B: Maximum number of dimerizations
r = 9;
count = 0
while (r > 1)
    r = r - 2
    count = count+1
end

count

%%%%
% Introduction to vectors and atrices
%%%%

% Exercise 1.1.2
M = [1 2 3; 4 5 6; 7 8 9; 10 11 12];

% Value of M12 and M41
M(1,2);
M(4,1);

% The same indexes but fro the transposed matrix
MT = M';
MT(2,1);
MT(1,4);

% Colum vector with integers from 1 to 10
a = [1:10]';

% Row vector with 5 first even numbers
b = 2:2:10;

% Matric of 2x6 with the first 12 integers
c = [ 1:6 ; 7:12];


%%%%
% Mathematical representations of a Petri Net
%%%%
W_sr = [0 1; 2 0];
W_rs = [2 0; 0 1];

A = W_rs - W_sr;

S = A'; % This is just the stoichiometry matrix

% Exercise 1.1.3. Lotka-Voletraa model
%1. R1: X -> 2X // prey birth
%2. R2: X + Y -> 2Y // predation of the prey
%3. R3: Y -> 0 // predator death
W_sr = [2 0 ; 0 2 ; 0 0];
W_rs = [1 0 ; 1 1 ; 0 1];

A = W_sr - W_rs;
S = A';


%%%%
% Matrix calculations
%%%%

% Multiplying matrices in matlab is a ver easy thing to do
A = [1 2; 3 4];
B = [5 6; 7 8];
A*B

% you can also be interested in multiplying a natrix by a vector
v = [1; 2];
solution = A*v;

% Exercise 1.1.4. Calculate the following matrix products (where they
% exist)

%a)
A = [7 2 ; 2 -3];
B = [4 3 ; 2 -3];
A*B

%b)
v = [2 5];
B = [1 2; 1 2];
v*B

%c)
v_one = [1;-2];
v_two = [3 0 -4];
v_one*v_two

%d)
A = [3 1 2 ; -5 5 1];
B = [-3 0 1 ; 1 3 0 ; 2 1 -3];
A*B

%e) Not valid as the number of rows of the 1st matrix is smaller than the
%number of rows of the second

%%%%
% Identity matrices
%%%%

% The identity matrices satisfies IA = AI = A; They are formed as the same
% with a matrix of the same dimension of A where all the elements are 0
% except the diagonal where we find 1's values

% From here we can extract also the inverse matrix X as the matrix 
% satisfying AX = I. Only the square matrices can be inverted. To obtain
% the inverse, we can use the inv() function

A = [1 2 ; 3 4];
inv(A)

% We can checkt the theroem:
invA = inv(A);
A*invA % this operation results in the identity matrix

% When a matrix cannot be inverted it is called SINGULAR. An easy way to
% detect them is by computing its detemrinant which if equal to zero means
% the matrix is singular. Example:
A = [1 2; 2 4];
det(A)

% This always occurs if one of the rows is multiple of other. This is
% called LINEAR DEPENDENCE

% Exercise: compute the dteerminant for this matrices and the inverse if
% exist
A = [7 2 ; 2 -3];
B = [2 5 ; 1 2];
C = [1; -2];
D = [12 4 ; 3 1];

% Do a loop 
problem_set = cell(1,4);

problem_set{1}=A;
problem_set{2}=B;
problem_set{3}=C;
problem_set{4}=D;

count = 1;
while (count <= 4)
    matrix = problem_set{count};
    sq = size(matrix);
    if sq(1) == sq(2)
        determ = det(matrix);
        disp(determ)
        if determ ~= 0
            invM = inv(matrix);
            disp(invM)
        else
            disp('singular matrix; inverse non computable')
        end
    else
        disp('non square matrix; determinant non computable')
    end
    count = count+1;
end

%%%%
% Modelling reactions in a petri net
%%%%

% Again we have r = 9 and r_two = 0. We have a vector u = (1 2)T
% representing we see 1 monomerisation and 2 dimerisations:

W_sr = [0 1 ; 2 0];
W_rs = [2 0 ; 0 1];

A = W_rs - W_sr;

S = A';

m = [9 ; 0];
u = [1 ; 2];

mu = m + S*u % With this we obtain the resulting state after the three reactions given by u.

% Exercise 1.1.6: Calculate the resulting state of the system if m = (221
% 52)T and two different u's:

m = [221 ; 52];

% a
u = [11 ; 23];

mu = m + S*u

% b
u = [21 ; 17];
mu = m + S*u

% With some calculations you can easily retrieve the ste of reactions have
% ocurred (u) from m(u)


%%%%
% Invariants
%%%%
%The invariant (vector x) of a system, is defines as the solution to the
%equation Sx = 0

null(S, 'r')

% This give us the number of reactions that leaves the number of species
% unchanged

%%%%
% A PETRI NET MODEL FOR PROTEIN SYNTHESIS
%%%%

% Exercise 1.1.9:
W_sr = [ 1 0 0; 0 1 0; 0 1 0; 0 0 1 ];
W_rs = [ 0 1 0; 1 0 0; 0 1 1; 0 0 0 ];
A=W_rs-W_sr;

S = A'

% Exercise 1.1.10:
% Conservation law:
null(A, 'r')
% Invariants:
null(S,'r')

%%%%
% MODELLING PLASMID REPLICATION
%%%%

W_sr = zeros(13,10);
W_sr(1,1) = 1; W_sr(1,10) = 1;
W_sr(2,2) = 1;
W_sr(3,3) = 1;
W_sr(4,3) = 1;
W_sr(5,4) = 1;
W_sr(6,2) = 1; W_sr(6,8) = 1;
W_sr(7,6) = 1;
W_sr(8,6) = 1;
W_sr(9,5) = 1;
W_sr(10,6) = 1; W_sr(10,9) = 1;
W_sr(11,7) = 1;
W_sr(12,7) = 1;
W_sr(13,5) = 1;

% Exercise 1.1.12
W_rs = zeros(13,10);
W_rs(1,2)=1;
W_rs(2,3)=1;
W_rs(3,[1 10])=1;
W_rs(4,4)=1;
W_rs(5,1)=2;
W_rs(5,10)=1;
W_rs(6,6)=1;
W_rs(7,[2 8])=1;
W_rs(8,[5])=1;
W_rs(9,[6])=1;
W_rs(10,[7])=1;
W_rs(11,[6 9])=1;
W_rs(12,[5 9])=1;
W_rs(13,[1 8 10])=1;

% Find S:
A=W_rs-W_sr;

S = A'

% Conservation law:
null(A, 'r')
% Invariants:
null(S,'r')