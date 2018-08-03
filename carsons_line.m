%%%%%%%%%inputs
ra=0.306; %ohm/mi
rn=0.592;
GMRa=0.0244; %feet
GMRn=0.00814; %feet
Dab=2.5; %feet
Dac=7; %feet
Dbc=4.5; %feet\
Dcn=5; %feet
Dan=(4^2+4^2)^0.5;
Dbn=(1.5^2+4^2)^0.5;

%%%Constants
f=60;%Hz
omegak=0.12134;
De=2790; %feet for soil resistivity of 100 ohm.m
%De=2160(pho/f)^0.5 %ft


%%%%Internal Calculations
rd=1.588*f*10^-3; %ohm/mi

%%%Self impedance
Zaa=ra+rd+j*omegak*log(De/GMRa);
Zbb=Zaa;
Zcc=Zaa;
Znn=rn+rd+j*omegak*log(De/GMRn);

%%%Mutual impedance
Zab=rd+omegak*j*log(De/Dab);
Zac=rd+omegak*j*log(De/Dac);
Zan=rd+omegak*j*log(De/Dan);

Zbc=rd+omegak*j*log(De/Dbc);
Zbn=rd+omegak*j*log(De/Dbn);

Zcn=rd+omegak*j*log(De/Dcn);

%%%%%
  Zprim=[Zaa Zab Zac Zan;
     Zab Zbb Zbc Zbn;
     Zac Zbc Zcc Zcn;
     Zan Zbn Zcn Znn];
 Z=Zprim;
             
 Zprimkron=Z(1:3,1:3)-Z(1:3,4)*Z(4,4)^-1*Z(4,1:3);%phase impedance matrix Zy ohm/mi kron reduced Z


