function xuLLS = LLS(X,r2,L)
b = r2 - sum(X'.^2,2);
A = [-2*X' ones(L,1)];
xuLLS = pinv(A'*A)*A'*b; xuLLS = xuLLS';
end