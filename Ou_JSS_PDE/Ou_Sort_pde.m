clear all;   
clc


imgdir = dir('*.bmp');
performance = zeros(length(imgdir)*2,100);
Th_index = zeros(length(imgdir),1);


for i = 1:1
I = double(imread([imgdir(i).name]));
nImg= 2*(i-1)+1;

Com = 1000*ones(1,100);

% I = double(imread('Lena.bmp'));
pre = 0;
cur = 0;
lat = 0;
tic
nCom = 1;
for j = 16:2:64
    rate = 0;
    Rk = j;

    [comentropy] = E_cal(I,j);
   
    Com(j) = comentropy;
    if nCom>= 3 &&  Com(j-4) >= Com(j-2) && Com(j-2) < Com(j)
        break
    end
    nCom = nCom + 1;
end
[value index] = min(Com(:));
Tk = index;
nPer = zeros(2,100);

pforbpp = 1;
for Th = 0.1:0.1:1
    [b,p,embedded,LM]=embedding_ou(I,Th,Tk);
    if strcmp(p,'inf')
        nPer(1,pforbpp)=0;
        nPer(2,pforbpp)=0;
        pforbpp = pforbpp + 1;
        continue;
    end
    nPer(1,pforbpp)=b;
    nPer(2,pforbpp)=p;
    pforbpp = pforbpp + 1;
end

performance(nImg,:) = nPer(1,:);
performance(nImg+1,:) = nPer(2,:);
toc
end


