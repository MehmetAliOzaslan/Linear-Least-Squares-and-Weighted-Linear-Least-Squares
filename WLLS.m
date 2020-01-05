function xuWLLS = WLLS(X,r2,L,sigma2)
A = [-2*X' ones(L,1)];
b = r2 - sum(X'.^2,2);
W = (1/4)*diag(1./(sigma2.*r2));
xuWLLS = pinv(A'*W*A)*A'*W*b; xuWLLS = xuWLLS';
end