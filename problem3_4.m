N = 10;
k = 0:N-1; n = 0:N-1;
A = sqrt(2/(N+1))*sin(pi*(k'+1)*(n+1)/(N+1));
B = sqrt(1/N)*(cos(2*pi*k'*n/N)+sin(2*pi*k'*n/N));

a = A'*A; % If result is Identity Matrix A is a Orthogonal Matrix 
b = B'*B; % If result is Identity Matrix B is a Orthogonal Matrix



