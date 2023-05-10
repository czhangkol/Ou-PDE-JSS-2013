function PDE = sort_pde(u,d,l,r,Tk)
 mean = 0;
 t=1; 
 du = 0;
 dd = 0;
 dl = 0;
 dr = 0; 
 It = 0; 
 Iter = 200; 
 lamda = 0.15;
 mean = ( u+d+l+r )/4;
 du = u-mean; dl = l-mean; dd = d-mean; dr = r-mean;
 Cu = 1/(1+(du^2/Tk^2));Cl = 1/(1+(dl^2/Tk^2));Cd = 1/(1+(dd^2/Tk^2));Cr = 1/(1+(dr^2/Tk^2));
 It = mean;
 while(t < Iter)
 It = It+lamda*( Cu*du+Cd*dd+Cl*dl+Cr*dr );
 du = u-It; dl =  l-It; dd =  d-It; dr =  r-It;
 Cu = 1/(1+(du^2/Tk^2));Cl = 1/(1+(dl^2/Tk^2));Cd = 1/(1+(dd^2/Tk^2));Cr = 1/(1+(dr^2/Tk^2));
 t = t+1;
 end
 PDE = round(It);
                      
            
            
end