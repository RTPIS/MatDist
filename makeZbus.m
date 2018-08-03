
clear all;clc;
%Transmission lines
YTXprim;
RDmethod;
 
Ybus=zeros(12,12);

%adding Line 1 2
%creating Ynode from Yprimitive for line
%capacitance of distrinbution lines lumped at node 2 and 3
yc12=Yc12;% capacitance
NODELISTL12=["2a" "2b" "2c" "2n" ];
YnodeL12=[Y12+2*yc12];
Ybus(1:4,1:4)=Ybus(1:4,1:4)+YnodeL12;

%adding tf
NODELISTTF=[ "2a" "2b" "2c" "2n" "3a" "3b" "3c" "3n"];
Ybus(1:8,1:8)=Ybus(1:8,1:8)+Ytfprim;
Ybus(4,4)=Ybus(4,4)+1000; %0.001 neutral impedance primary HV side
Ybus(8,8)=Ybus(8,8)+1000; %0.001 neutral impedance primary HV side

%adding Line 3 4
%creating Ynode from Yprimtive for line
yc34=Yc34;% capacitance
NODELISTL34=["3a" "3b" "3c" "3n" "4a" "4b" "4c" "4n"];
YnodeL34=[Y34+2*yc34 -Y34;-Y34 Y34+2*yc34];
Ybus(5:12,5:12)=Ybus(5:12,5:12)+YnodeL34;
Zbus=inv(Ybus);


% s=2000*1000*(0.9+j*sin(acos(0.9)));S=s*ones(3,1);
% Iload=conj(S./V4);Iinjk=[zeros(8,1);-Iload;0];
% 
% Y0g=[Y12+2*yc12];
% Iog=Y0g*[V2;0];
% I23=checkI(1:4)-Iog;
% abs(I23);
%  
% dVk=Zbus*Iinjk;

% Vkp1=Vnl+dVk;
% 
% I4fromans=[1042.8 -34.9; 970.2 -154.2; 1009.6 85.0];
% I1fromans=[347.9 -34.9;323.7 -154.2; 336.8 85.0];
% 
% I4cmpfromans=pol2cmp(I4fromans);
% I1cmpfromans=pol2cmp(I1fromans);
% Ians=[I1cmpfromans;0;zeros(8,1)];




% V12base=12470/(3^0.5);
% V34base=4160/(3^0.5);
% 
% V1g=[V12base 0;V12base -120;V12base 120];
% V2g= [7107 -0.3;7140 -120.3;7121  119.6];
% V3g=[2247.6 -3.7;2269 -123.5;2256 116.4];
% V4g=[1918 -9.1;2061 -128.3; 1981 110.9];
% % V4nl=[V34base 0;V34base -120;V34base 120];
% 
% V1=pol2cmp(V1g);
% V2=pol2cmp(V2g);
% V3=pol2cmp(V3g);
% V4=pol2cmp(V4g);
% %V4noload=pol2cmp(V4nl);
% Vfinal=[V2;0;V3;0;V4;0];
% % Vnl=[V1;0;V1;0;V4noload;0;V4noload;0];
% % tfcurrent=abs(Ytfprim*[V2; 0;V3; 0]);
% % checkI12=abs(YnodeL12*[V1; 0;V2; 0]);
% % % checkI34=abs(YnodeL34*[V3; 0;V4; 0]);
% % % 
% % % %%%checkYbus
% % checkI= Ybus*Vfinal;
% % abs(checkI);
% % disp("Ybus is correct. Confirmed in line 50"); 
% % Zbus=inv(Ybus);
% % 
% % s=2000*1000*(0.9+j*sin(acos(0.9)));
% % S=s*ones(3,1);
% % Iload=conj(S./V4);
% % Iinjk=[zeros(8,1);-Iload;0];
% % 
% % Y0g=[Y12+2*yc12];
% % Iog=Y0g*[V2;0];
% % I23=checkI(1:4)-Iog;
% % abs(I23);
% % 
% % % 
% % % dVk=Zbus*Iinjk;
% % % Vkp1=Vnl+dVk;
% % % 
% % % I4fromans=[1042.8 -34.9; 970.2 -154.2; 1009.6 85.0];
% % % I1fromans=[347.9 -34.9;323.7 -154.2; 336.8 85.0];
% % % 
% % I4cmpfromans=pol2cmp(I4fromans);
% % I1cmpfromans=pol2cmp(I1fromans);
% % Ians=[I1cmpfromans;0;zeros(8,1);-I4cmpfromans;0]
% % It1=  (-0.8570 + 0.5972i
% %    0.8757 + 0.4186i
% %   -0.0896 - 1.0025i
% %    0.0166 - 0.0030i]*1000;
% % Iinjk1=[zeros(12,1);It1];
% % dV=Zbus*Iinjk1
% % 
% % dVke=Vfinal-Vnl
% % absdVk=abs(dVke)
