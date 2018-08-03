%Run Gauss Power flow
IEEE4BUSYgYgGaussPowerFlow
%IEEE_Results
V2g= [7107 -0.3;7140 -120.3;7121  119.6];
V3g=[2247.6 -3.7;2269 -123.5;2256 116.4]
V4g=[1918 -9.1;2061 -128.3; 1981 110.9]
%converting to complex
V2IEEE=pol2cmp(V2g);
V3IEEE=pol2cmp(V3g);
V4IEEE=pol2cmp(V4g);
VIEEE=[pol2cmp(V2g);sum(pol2cmp(V2g));pol2cmp(V3g);sum(pol2cmp(V3g));pol2cmp(V4g);sum(pol2cmp(V4g));]

V_Mod_dif=abs(V(:,k)-VIEEE)
V_Mod_dif_Percent=100*V_Mod_dif./abs(VIEEE)