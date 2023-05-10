function [comentropy] = E_cal(I,k)
  %迭代次数
Iter = 100; 
I1 = zeros(size(I));
I2 = zeros(size(I));
It = zeros(size(I));
d = zeros(size(I));
%%dot型的像素估计
HisD =zeros(512,1);
HisC =zeros(512,1);
lamda = 0.15;

[d1 d2] = size(I);
for i = 2:d1-1
    for j = 2:d2-1
        
        if(mod(i,2)~=0 && mod(j,2)==0)
            I1(i,j) = ( I(i-1,j)+I(i,j-1)+I(i+1,j)+I(i,j+1) )/4;
            d(i,j) = round(I(i,j) - I1(i,j));
            du = I(i-1,j)-I1(i,j); dl = I(i,j-1)-I1(i,j); dd = I(i+1,j)-I1(i,j); dr = I(i,j+1)-I1(i,j);
%             du = I(i-1,j)-I1(i+1,j); dl = I(i,j-1)-I1(i,j+1); dd = I(i+1,j)-I1(i-1,j); dr = I(i,j+1)-I1(i,j-1);
            Cu = 1/(1+(du^2/k^2));Cl = 1/(1+(dl^2/k^2));Cd = 1/(1+(dd^2/k^2));Cr = 1/(1+(dr^2/k^2));
            t=1;
            It(i,j) = I1(i,j);
           while(t < Iter)
            It(i,j) = It(i,j)+lamda*( Cu*du+Cd*dd+Cl*dl+Cr*dr );
            du = I(i-1,j)-It(i,j); dl = I(i,j-1)-It(i,j); dd = I(i+1,j)-It(i,j); dr = I(i,j+1)-It(i,j);
            Cu = 1/(1+(du^2/k^2));Cl = 1/(1+(dl^2/k^2));Cd = 1/(1+(dd^2/k^2));Cr = 1/(1+(dr^2/k^2));
            t = t+1;
           end
            d(i,j) = round(I(i,j) - It(i,j));           
            HisD(d(i,j)+256) = HisD(d(i,j)+256) + 1;
            
                
        end
        
    end
end
for i = 2:d1-1
    for j = 2:d2-1
        if(mod(i,2)==0 && mod(j,2)~=0)
            I1(i,j) = ( I(i-1,j)+I(i,j-1)+I(i+1,j)+I(i,j+1) )/4;
            d(i,j) = round(I(i,j) - I1(i,j));
            du = I(i-1,j)-I1(i,j); dl = I(i,j-1)-I1(i,j); dd = I(i+1,j)-I1(i,j); dr = I(i,j+1)-I1(i,j);
%             du = I(i-1,j)-I1(i+1,j); dl = I(i,j-1)-I1(i,j+1); dd = I(i+1,j)-I1(i-1,j); dr = I(i,j+1)-I1(i,j-1);
            Cu = 1/(1+(du^2/k^2));Cl = 1/(1+(dl^2/k^2));Cd = 1/(1+(dd^2/k^2));Cr = 1/(1+(dr^2/k^2));
            t=1;
            It(i,j) = I1(i,j);
           while(t < Iter)
            It(i,j) = It(i,j)+lamda*( Cu*du+Cd*dd+Cl*dl+Cr*dr );
            du = I(i-1,j)-It(i,j); dl = I(i,j-1)-It(i,j); dd = I(i+1,j)-It(i,j); dr = I(i,j+1)-It(i,j);
            Cu = 1/(1+(du^2/k^2));Cl = 1/(1+(dl^2/k^2));Cd = 1/(1+(dd^2/k^2));Cr = 1/(1+(dr^2/k^2));
            t = t+1;
           end
            d(i,j) = round(I(i,j) - It(i,j));           
            HisD(d(i,j)+256) = HisD(d(i,j)+256) + 1;
           
        end
    end
end

%%cross型的像素估计
for i = 2:d1-1
    for j = 2:d2-1
        
        if(mod(i,2)~=0 && mod(j,2)~=0)
            I1(i,j) = ( I(i-1,j)+I(i,j-1)+I(i+1,j)+I(i,j+1) )/4;
            d(i,j) = round(I(i,j) - I1(i,j));
            du = I(i-1,j)-I1(i,j); dl = I(i,j-1)-I1(i,j); dd = I(i+1,j)-I1(i,j); dr = I(i,j+1)-I1(i,j);
            Cu = 1/(1+(du^2/k^2));Cl = 1/(1+(dl^2/k^2));Cd = 1/(1+(dd^2/k^2));Cr = 1/(1+(dr^2/k^2));
            t=1;
            It(i,j) = I1(i,j);
            while(t < Iter)
            It(i,j) = It(i,j)+lamda*( Cu*du+Cd*dd+Cl*dl+Cr*dr );
            t = t+1;
            du = I(i-1,j)-It(i,j); dl = I(i,j-1)-It(i,j); dd = I(i+1,j)-It(i,j); dr = I(i,j+1)-It(i,j);
            Cu = 1/(1+(du^2/k^2));Cl = 1/(1+(dl^2/k^2));Cd = 1/(1+(dd^2/k^2));Cr = 1/(1+(dr^2/k^2));
            end
            d(i,j) = round(I(i,j) - It(i,j));
            HisC(d(i,j)+256) = HisC(d(i,j)+256) + 1;
            
           
            
            
        end
        
    end
end
for i = 2:d1-1
    for j = 2:d2-1
        if(mod(i,2)==0 && mod(j,2)==0)
           I1(i,j) = ( I(i-1,j)+I(i,j-1)+I(i+1,j)+I(i,j+1) )/4;
            d(i,j) = round(I(i,j) - I1(i,j));
            du = I(i-1,j)-I1(i,j); dl = I(i,j-1)-I1(i,j); dd = I(i+1,j)-I1(i,j); dr = I(i,j+1)-I1(i,j);
            Cu = 1/(1+(du^2/k^2));Cl = 1/(1+(dl^2/k^2));Cd = 1/(1+(dd^2/k^2));Cr = 1/(1+(dr^2/k^2));
            t=1;
            It(i,j) = I1(i,j);
            while(t < Iter)
            It(i,j) = It(i,j)+lamda*( Cu*du+Cd*dd+Cl*dl+Cr*dr );
            t = t+1;
            du = I(i-1,j)-It(i,j); dl = I(i,j-1)-It(i,j); dd = I(i+1,j)-It(i,j); dr = I(i,j+1)-It(i,j);
            Cu = 1/(1+(du^2/k^2));Cl = 1/(1+(dl^2/k^2));Cd = 1/(1+(dd^2/k^2));Cr = 1/(1+(dr^2/k^2));
            end
            d(i,j) = round(I(i,j) - It(i,j));
            HisC(d(i,j)+256) = HisC(d(i,j)+256) + 1;
           
        end
    end
end

comentropy = 0;
E = HisD+HisC;
Base = sum(E);
for i= 1:511
    if(HisD(i) ~=0)
    comentropy =  comentropy-(E(i)/Base)*log10(E(i)/Base);
    end
end

end