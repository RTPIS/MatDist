function s = pol2cmp(A) %theta in degrees 1st column rho and second column dgrees
rho=A(:,1);
thetadeg=A(:,2);
thetarad=thetadeg*pi()/180;
[x,y] = pol2cart(thetarad,rho);
s=x+y*j;