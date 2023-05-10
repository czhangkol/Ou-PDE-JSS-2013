function [bpp psnr embedded LM]=embedding(I,BPP,Tk)
[watermarked, LM] =embeddingonce_ou(I,BPP/2,0,Tk);
 location = LM;
[watermarked, LM]=embeddingonce_ou(watermarked,BPP/2,1,Tk);
location = LM + location;
embedded=watermarked - location;
psnr=PSNR(watermarked(:),I(:));
bpp=BPP;
end