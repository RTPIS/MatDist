makeZbus;
%Calculate base/slack values
V2base=12470/(3^0.5); V34base=4160/(3^0.5);
Vhvb=[V12base 0;V12base -120;V12base 120]; Vlvb=[V34base 0;V34base -120;V34base 120];
VhvB=pol2cmp(Vhvb);VlvB=pol2cmp(Vlvb);%convert to complex
Vbase=[VhvB;0;VlvB;0;VlvB;0];%Vbase - is the voltage vector for slack voltages
%Calculate Load
S3p=2000*1000*(0.9+j*sin(acos(0.9)));
SLD=S3p*ones(3,1);
V(:,1)=Vbase;  %initialize voltage vector
ILD=conj(SLD./Vbase(9:11));%current into the load
I_inj=[zeros(8,1);-ILD;0];%full vector of current injection to the system
k=20 %Input number of iterations
for i=1:k
    dv(:,i)=Zbus*I_inj(:,i);
    dvmag(:,i)=abs(dv(:,i));
    V(:,i+1)=Vbase+dv(:,i);
    Vmag(:,i+1)=abs(V(:,i+1));
    ILD=conj(SLD./V(9:11,i+1));
    I_inj(:,i+1)=[zeros(8,1);-ILD;0];
end
dvmag
Vmag
Vangle=180*angle(V)/pi