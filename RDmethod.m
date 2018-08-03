
z=(0.01+0.06j);
za=z*(1^2/(2*10^6));%impedance converted to a one volt base; Sbase 1 phase= 2 MVA
ZB=zeros(3,3); ZB = full(spdiags(za*(ones(3,1)),0,ZB));%replace diagonals with zb
B=[1 0 0;-1 0 0;0 1 0;0 -1 0; 0 0 1; 0 0 -1];
Y1=B*inv(ZB)*B';
Vpbase=12470/sqrt(3);Vsbase=4160/sqrt(3);
Na=[1/Vpbase 0;-1/Vpbase 0;0 1/Vsbase;0 -1/Vsbase];
N=zeros(12,6); N(1:4,1:2)=Na;N(5:8,3:4)=Na;N(9:12,5:6)=Na;
Yw=N*Y1*N';
A=zeros(8,12);
A(1,1)=1;%I1
A(2,5)=1;%I2
A(3,9)=1;%I3
A(4,[2,6,10])=1;%I4=Iw2a+Iw2b+Iw2c
A(5,3)=1;%I5
A(6,7)=1;%I6
A(7,11)=1;%I7
A(8,[4,8,12])=1;%I8=Iw4a+Iw4b+Iw4c
Ytfprim=A*Yw*A';%YTFPRIM CONFIRMED CORRECT BY COMPARING WITH OPENDSS, OPENDSS gives the same exact Ytfprim
%%%%%
% % adding neutral impedance of the Y-connected windings
% %   Ytfprim(4,:)=Ytfprim(4,:)+1000000j; %0.01 neutral impedance primary HV side
% %   Ytfprim(:,4)=Ytfprim(:,4)+1000000j; %0.01 neutral impedance primary HV side
% %   Ytfprim(8,:)=Ytfprim(8,:)+1000000j; %0.01 neutral impedance primary HV side
% %   Ytfprim(:,8)=Ytfprim(:,8)+1000000j; %0.01 neutral impedance primary HV side
% %   Ytfprim(4,4)=Ytfprim(4,4)+1000; %0.01 neutral impedance primary HV side
% %   Ytfprim(8,8)=Ytfprim(8,8)+1000; %0.01 neutral impedance primary HV side
% %   deleting neutral
% %   Ytfprimk=[Ytfprim(1:3,1:3),Ytfprim(1:3,5:7);Ytfprim(5:7,1:3),Ytfprim(5:7,5:7)];
% %   
% Ztfprimk=Ytfprimk^-1

V2g= [7107 -0.3;7140 -120.3;7121  119.6];
V3g=[2247.6 -3.7;2269 -123.5;2256 116.4];

V2=pol2cmp(V2g); V3=pol2cmp(V3g);
% I=Ytfprim*[V2; sum(V2);V3; sum(V3)];
%  abs(I);
%  Ztfprim=Ytfprim^-1;
