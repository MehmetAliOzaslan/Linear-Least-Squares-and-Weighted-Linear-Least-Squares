clear; clc; close all

x1 = [0,0]; x2 = [0,10]; x3 = [10,0]; x4 = [10,10];
X = [x1;x2;x3;x4]'; x = [2,3]'; L = size(X,2); 
d = (sqrt(sum((x*ones(1,L)-X).^2,1))).';
m = 0; iterN = 1000;

for dB = -10:5:60
    sigma2 = (d.^2)/(10.^(dB/10));
    for i = 1:iterN
        r2 = (d + randn(L,1).*sqrt(sigma2)).^2;  
        xuLLS = LLS(X,r2,L);
        xuWLLS = WLLS(X,r2,L,sigma2);
        lls(i,:) = xuLLS; 
        wlls(i,:) = xuWLLS;
    end
    res_1 = (lls(:,1) - x(1)).^2  + (lls(:,2) - x(2)).^2;
    res_2 = (wlls(:,1) - x(1)).^2  + (wlls(:,2) - x(2)).^2;
    m = m + 1
    result_1(m,:) = mean(res_1);
    result_2(m,:) = mean(res_2);
end
dBrange = -10:5:60;
plot(dBrange, 10*log10(result_1),'k+', dBrange, 10*log10(result_2),'ko'); 
xlabel('SNR (dB)'); ylabel('Mean Square Position Error (dB)');
legTitle = legend('LLS', 'WLLS'); title(legTitle, 'Approaches'); saveas(gcf, 'MSPE.png')